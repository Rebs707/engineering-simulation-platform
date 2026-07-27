variable "namespace" {
  description = "Kubernetes namespace for Prometheus."
  type        = string
  default     = "monitoring"
}

variable "release_name" {
  description = "Helm release name."
  type        = string
  default     = "prometheus"
}

variable "chart_version" {
  description = "Prometheus Helm chart version."
  type        = string
  default     = "27.20.1"
}

variable "storage_size" {
  description = "Persistent storage size for the Prometheus server."
  type        = string
  default     = "20Gi"
}
