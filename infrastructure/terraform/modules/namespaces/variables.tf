variable "namespaces" {
  description = "Kubernetes namespaces managed by Terraform."
  type        = list(string)

  default = [
    "platform-system",
    "monitoring",
    "argocd"
  ]

  validation {
    condition     = length(var.namespaces) > 0
    error_message = "At least one Kubernetes namespace must be provided."
  }
}

variable "environment" {
  description = "Deployment environment used for namespace labels."
  type        = string
}
