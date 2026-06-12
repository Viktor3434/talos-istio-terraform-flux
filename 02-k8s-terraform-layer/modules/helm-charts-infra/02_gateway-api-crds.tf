# 02-k8s-terraform-layer/modules/helm-charts-infra/gateway-api.tf

###
# Install CRDs
###

data "kubectl_file_documents" "split_gateway_crds" {
  content = file("${path.module}/charts/standard-install.yaml")

}

resource "null_resource" "force_helm_template" {
  triggers = {
    manifests = jsonencode(data.kubectl_file_documents.split_gateway_crds.manifests)
  }
}

resource "kubectl_manifest" "gateway_crds" {
  for_each  = data.kubectl_file_documents.split_gateway_crds.manifests
  yaml_body = each.value

  server_side_apply = true # CRD требуют server-side apply из-за размера OpenAPI схем
  force_conflicts   = true # При удалении стенда CRD удаляются автоматически

  depends_on = [data.kubectl_file_documents.split_gateway_crds]
}
