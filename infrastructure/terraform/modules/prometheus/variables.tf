variable "namespace" {
  type    = string
  default = "monitoring"
}

variable "release_name" {
  type    = string
  default = "prometheus"
}

variable "chart_version" {
  type    = string
  default = "27.19.0"
}

variable "grafana_enabled" {
  description = "Enable Grafana in the monitoring stack."
  type        = bool
  default     = true
}

variable "grafana_service_type" {
  description = "Kubernetes service type for Grafana."
  type        = string
  default     = "ClusterIP"
}
