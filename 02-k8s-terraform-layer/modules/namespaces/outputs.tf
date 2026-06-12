###
# Default NS
###
output "namespaces" {
  description = "Map of created namespaces"
  value       = { for k, v in kubernetes_namespace.default_ns : k => v.metadata[0].name }
}

output "istio_system_namespace" {
  description = "Name of gateway-api namespace"
  value       = kubernetes_namespace.default_ns["istio-system"].metadata[0].name
}

output "flux_system_namespace" {
  description = "Name of argocd namespace"
  value       = kubernetes_namespace.default_ns["flux-system"].metadata[0].name
}

###
# Privileged NS
###
output "metallb_namespace" {
  description = "Name of metallb namespace"
  value       = kubernetes_namespace_v1.privileged_ns["metallb"].metadata[0].name
}
