variable "cluster_name" {
  description = "Name of the EKS cluster."
  type        = string
}

variable "cluster_oidc_provider_arn" {
  description = "ARN of the EKS OIDC provider."
  type        = string
}

variable "cluster_oidc_issuer_url" {
  description = "OIDC issuer URL of the EKS cluster."
  type        = string
}

variable "aws_region" {
  description = "AWS region containing the EKS cluster."
  type        = string
}

variable "iam_policy_arn" {
  description = "IAM policy ARN for Cluster Autoscaler."
  type        = string
}
