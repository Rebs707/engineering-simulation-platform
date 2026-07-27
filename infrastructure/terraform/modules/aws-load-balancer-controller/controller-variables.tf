variable "namespace" {
  description = "Kubernetes namespace for the controller."
  type        = string
  default     = "platform-system"
}

variable "service_account_name" {
  description = "Kubernetes service account used by the controller."
  type        = string
  default     = "aws-load-balancer-controller"
}

variable "release_name" {
  description = "Helm release name."
  type        = string
  default     = "aws-load-balancer-controller"
}

variable "chart_version" {
  description = "AWS Load Balancer Controller Helm chart version."
  type        = string
  default     = "1.8.1"
}
