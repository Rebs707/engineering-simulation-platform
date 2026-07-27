variable "cluster_name" {
  description = "EKS cluster name."
  type        = string
}

variable "cluster_oidc_provider_arn" {
  description = "ARN of the EKS OIDC provider."
  type        = string
}

variable "cluster_oidc_issuer_url" {
  description = "OIDC issuer URL for the EKS cluster."
  type        = string
}

variable "aws_region" {
  description = "AWS region hosting the EKS cluster."
  type        = string
}

variable "iam_role_name" {
  description = "IAM role name used by Cluster Autoscaler."
  type        = string
  default     = "cluster-autoscaler"
}
