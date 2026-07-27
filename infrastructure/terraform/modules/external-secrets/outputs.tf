output "release_name" {
  description = "External Secrets Helm release name."
  value       = helm_release.external_secrets.name
}

output "namespace" {
  description = "Namespace containing External Secrets."
  value       = helm_release.external_secrets.namespace
}

output "service_account_name" {
  description = "Kubernetes service account used by External Secrets."
  value       = var.service_account_name
}

output "iam_role_arn" {
  description = "IAM role ARN assumed by External Secrets."
  value       = aws_iam_role.external_secrets.arn
}
