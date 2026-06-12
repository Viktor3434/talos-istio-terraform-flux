variable "namespaces" {
  description = "List of namespaces to create"
  type        = list(string)
  default     = ["prometheus", "istio-system", "flux-system"]
}

variable "privileged_namespaces" {
  description = "List of namespaces to create"
  type        = list(string)
  default     = ["metallb"]
}
