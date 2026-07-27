variable "release_name" {
  description = "Name of the Metrics Server Helm release."
  type        = string
  default     = "metrics-server"
}

variable "namespace" {
  description = "Kubernetes namespace for Metrics Server."
  type        = string
  default     = "platform-system"
}

variable "chart_version" {
  description = "Metrics Server Helm chart version."
  type        = string
  default     = "3.12.2"
}

variable "replica_count" {
  description = "Number of Metrics Server replicas."
  type        = number
  default     = 2

  validation {
    condition     = var.replica_count >= 1
    error_message = "Metrics Server must have at least one replica."
  }
}
