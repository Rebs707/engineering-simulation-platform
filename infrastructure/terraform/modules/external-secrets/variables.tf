variable "namespace" {
  description = "Namespace for External Secrets."
  type        = string
  default     = "external-secrets"
}

variable "release_name" {
  description = "Helm release name."
  type        = string
  default     = "external-secrets"
}

variable "chart_version" {
  description = "External Secrets chart version."
  type        = string
  default     = "0.18.2"
}
