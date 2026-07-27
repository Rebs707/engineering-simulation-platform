output "release_name" {
  description = "Prometheus Helm release name."
  value       = helm_release.prometheus.name
}

output "namespace" {
  description = "Namespace containing Prometheus."
  value       = helm_release.prometheus.namespace
}
