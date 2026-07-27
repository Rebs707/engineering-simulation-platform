resource "helm_release" "argocd" {
  name             = var.release_name
  repository       = "https://argoproj.github.io/argo-helm"
  chart            = "argo-cd"
  namespace        = var.namespace
  create_namespace = true
  version          = var.chart_version
  wait             = true
  timeout          = 600

  set = [
    {
      name  = "server.service.type"
      value = var.service_type
    }
  ]
}
