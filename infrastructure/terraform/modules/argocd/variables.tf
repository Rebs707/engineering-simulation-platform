variable "namespace" {
  description = "Kubernetes namespace for Argo CD."
  type        = string
  default     = "argocd"
}

variable "release_name" {
  description = "Helm release name for Argo CD."
  type        = string
  default     = "argocd"
}

variable "chart_version" {
  description = "Argo CD Helm chart version."
  type        = string
  default     = "8.5.6"
}

variable "service_type" {
  description = "Kubernetes service type for the Argo CD server."
  type        = string
  default     = "ClusterIP"

  validation {
    condition     = contains(["ClusterIP", "NodePort", "LoadBalancer"], var.service_type)
    error_message = "service_type must be ClusterIP, NodePort, or LoadBalancer."
  }
}
