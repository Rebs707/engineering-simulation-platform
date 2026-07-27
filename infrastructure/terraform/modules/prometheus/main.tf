resource "helm_release" "prometheus" {
  name             = var.release_name
  repository       = "https://prometheus-community.github.io/helm-charts"
  chart            = "kube-prometheus-stack"
  namespace        = var.namespace
  create_namespace = true
  version          = var.chart_version
  wait             = true
  timeout          = 600

  set = [
    {
      name  = "grafana.enabled"
      value = tostring(var.grafana_enabled)
    },
    {
      name  = "grafana.service.type"
      value = var.grafana_service_type
    }
  ]
}
