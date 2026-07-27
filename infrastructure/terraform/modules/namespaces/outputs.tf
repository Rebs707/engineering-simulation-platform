output "namespace_names" {
  description = "Names of the Kubernetes namespaces created by this module."
  value       = sort(keys(kubernetes_namespace_v1.this))
}
