resource "helm_release" "argocd" {
  name             = var.release_name
  repository       = "https://argoproj.github.io/argo-helm"
  chart            = "argo-cd"
  version          = var.chart_version
  namespace        = var.namespace
  create_namespace = true

  atomic          = true
  cleanup_on_fail = true
  wait            = true
  timeout         = 600

  set = [
    {
      name  = "server.service.type"
      value = var.service_type
    },
    {
      name  = "server.autoscaling.enabled"
      value = "true"
    },
    {
      name  = "server.autoscaling.minReplicas"
      value = "2"
    },
    {
      name  = "server.autoscaling.maxReplicas"
      value = "5"
    },
    {
      name  = "controller.replicas"
      value = "2"
    },
    {
      name  = "repoServer.autoscaling.enabled"
      value = "true"
    },
    {
      name  = "repoServer.autoscaling.minReplicas"
      value = "2"
    },
    {
      name  = "repoServer.autoscaling.maxReplicas"
      value = "5"
    }
  ]
}
