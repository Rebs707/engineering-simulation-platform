output "release_name" { value = helm_release.prometheus.name }
output "namespace" { value = helm_release.prometheus.namespace }

output "grafana_enabled" {
  description = "Whether Grafana is enabled in the monitoring stack."
  value       = var.grafana_enabled
}

output "grafana_service_name" {
  description = "Expected Grafana Kubernetes service name."
  value       = "${helm_release.prometheus.name}-grafana"
}
