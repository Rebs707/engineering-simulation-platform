resource "helm_release" "prometheus" {
  name             = var.release_name
  repository       = "https://prometheus-community.github.io/helm-charts"
  chart            = "prometheus"
  namespace        = var.namespace
  version          = var.chart_version
  create_namespace = true
  wait             = true
  timeout          = 900

  set = [
    {
      name  = "server.persistentVolume.enabled"
      value = "true"
    },
    {
      name  = "server.persistentVolume.size"
      value = var.storage_size
    },
    {
      name  = "alertmanager.enabled"
      value = "true"
    },
    {
      name  = "pushgateway.enabled"
      value = "false"
    }
  ]
}
