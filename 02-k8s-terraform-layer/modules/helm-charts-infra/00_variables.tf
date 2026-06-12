variable "flux_system_namespace" {
  description = "Namespace where FluxCD will be installed"
  type        = string
}

variable "istio_system_namespace" {
  description = "Namespace where Istio will be installed"
  type        = string
}

variable "metallb_namespace" {
  description = "Namespace where Gateway-api will be installed"
  type        = string
}