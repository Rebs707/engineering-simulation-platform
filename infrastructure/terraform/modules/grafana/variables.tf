variable "namespace" {
  description = "Kubernetes namespace for Grafana."
  type        = string
  default     = "monitoring"
}

variable "release_name" {
  description = "Helm release name."
  type        = string
  default     = "grafana"
}

variable "chart_version" {
  description = "Grafana Helm chart version."
  type        = string
  default     = "9.2.10"
}

variable "storage_size" {
  description = "Persistent storage size for Grafana."
  type        = string
  default     = "10Gi"
}

variable "prometheus_url" {
  description = "Prometheus service URL used as the default Grafana datasource."
  type        = string
}
