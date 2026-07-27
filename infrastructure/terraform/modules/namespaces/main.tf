resource "kubernetes_namespace_v1" "this" {
  for_each = toset(var.namespaces)

  metadata {
    name = each.value

    labels = {
      "managed-by"  = "terraform"
      "environment" = var.environment
    }
  }
}
