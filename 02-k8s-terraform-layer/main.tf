module "del-flannel" {
  source = "./modules/del-flannel"
}

module "namespaces" {
  source = "./modules/namespaces"
}

module "cni-install" {
  source     = "./modules/cni-install"
  depends_on = [module.del-flannel]
}

module "helm-charts-infra" {
  source = "./modules/helm-charts-infra"

  istio_system_namespace = module.namespaces.istio_system_namespace
  flux_system_namespace  = module.namespaces.flux_system_namespace

  metallb_namespace = module.namespaces.metallb_namespace

  depends_on = [
    module.namespaces,
    module.cni-install
  ]
}