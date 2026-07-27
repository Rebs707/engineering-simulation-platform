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
  description = "External Secrets Helm chart version."
  type        = string
  default     = "0.18.2"
}

variable "service_account_name" {
  description = "Kubernetes service account used by External Secrets."
  type        = string
  default     = "external-secrets"
}

variable "cluster_oidc_provider_arn" {
  description = "ARN of the EKS OIDC provider."
  type        = string
}

variable "cluster_oidc_issuer_url" {
  description = "Issuer URL of the EKS OIDC provider."
  type        = string
}

variable "iam_role_name" {
  description = "Name of the IAM role used by External Secrets."
  type        = string
  default     = "external-secrets-controller"
}

variable "secret_arns" {
  description = "Secrets Manager secret ARNs External Secrets may read."
  type        = list(string)
  default     = ["*"]
}

variable "kms_key_arns" {
  description = "KMS key ARNs External Secrets may use for decryption."
  type        = list(string)
  default     = ["*"]
}
