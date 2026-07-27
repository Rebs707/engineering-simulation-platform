variable "namespace" {
  description = "Kubernetes namespace for Cluster Autoscaler."
  type        = string
  default     = "kube-system"
}

variable "service_account_name" {
  description = "Service account used by Cluster Autoscaler."
  type        = string
  default     = "cluster-autoscaler"
}

variable "release_name" {
  description = "Helm release name."
  type        = string
  default     = "cluster-autoscaler"
}

variable "chart_version" {
  description = "Cluster Autoscaler Helm chart version."
  type        = string
  default     = "9.46.6"
}
