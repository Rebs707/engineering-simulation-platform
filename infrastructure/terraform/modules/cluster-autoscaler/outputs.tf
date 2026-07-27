output "release_name" {
  description = "Cluster Autoscaler Helm release name."
  value       = helm_release.cluster_autoscaler.name
}

output "namespace" {
  description = "Namespace containing Cluster Autoscaler."
  value       = helm_release.cluster_autoscaler.namespace
}

output "iam_role_arn" {
  description = "IAM role ARN assumed by Cluster Autoscaler."
  value       = aws_iam_role.cluster_autoscaler.arn
}

output "service_account_name" {
  description = "Kubernetes service account used by Cluster Autoscaler."
  value       = var.service_account_name
}
