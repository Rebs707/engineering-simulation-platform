output "release_name" {
  description = "Grafana Helm release name."
  value       = helm_release.grafana.name
}

output "namespace" {
  description = "Grafana namespace."
  value       = helm_release.grafana.namespace
}

output "admin_password" {
  description = "Grafana admin password."
  value       = random_password.grafana_admin.result
  sensitive   = true
}
