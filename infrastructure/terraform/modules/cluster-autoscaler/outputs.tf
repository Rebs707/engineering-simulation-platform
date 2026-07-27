output "iam_role_arn" {
  value = aws_iam_role.cluster_autoscaler.arn
}

output "release_name" {
  value = helm_release.cluster_autoscaler.name
}

output "namespace" {
  value = helm_release.cluster_autoscaler.namespace
}
