output "release_name" {
  description = "Argo CD Helm release name."
  value       = helm_release.argocd.name
}

output "namespace" {
  description = "Argo CD namespace."
  value       = helm_release.argocd.namespace
}

output "server_service_name" {
  description = "Expected Argo CD server service name."
  value       = "${helm_release.argocd.name}-server"
}
