variable "namespace" {
  description = "Kubernetes namespace for Argo CD."
  type        = string
  default     = "argocd"
}

variable "release_name" {
  description = "Helm release name."
  type        = string
  default     = "argocd"
}

variable "chart_version" {
  description = "Argo CD Helm chart version."
  type        = string
  default     = "8.1.2"
}

variable "service_type" {
  description = "Service type for the Argo CD server."
  type        = string
  default     = "ClusterIP"
}
