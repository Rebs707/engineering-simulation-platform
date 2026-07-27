output "release_name" {
  description = "Name of the Metrics Server Helm release."
  value       = helm_release.metrics_server.name
}

output "namespace" {
  description = "Namespace where Metrics Server is deployed."
  value       = helm_release.metrics_server.namespace
}

output "status" {
  description = "Status of the Metrics Server Helm release."
  value       = helm_release.metrics_server.status
}
