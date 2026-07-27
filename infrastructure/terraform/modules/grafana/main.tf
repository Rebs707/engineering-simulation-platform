resource "random_password" "grafana_admin" {
  length  = 20
  special = false
}

resource "helm_release" "grafana" {
  name             = var.release_name
  repository       = "https://grafana.github.io/helm-charts"
  chart            = "grafana"
  namespace        = var.namespace
  version          = var.chart_version
  create_namespace = true
  wait             = true
  timeout          = 900

  set = [
    {
      name  = "adminPassword"
      value = random_password.grafana_admin.result
    },
    {
      name  = "persistence.enabled"
      value = "true"
    },
    {
      name  = "persistence.size"
      value = var.storage_size
    },
    {
      name  = "datasources.datasources\\.yaml.apiVersion"
      value = "1"
    },
    {
      name  = "datasources.datasources\\.yaml.datasources[0].name"
      value = "Prometheus"
    },
    {
      name  = "datasources.datasources\\.yaml.datasources[0].type"
      value = "prometheus"
    },
    {
      name  = "datasources.datasources\\.yaml.datasources[0].url"
      value = var.prometheus_url
    },
    {
      name  = "datasources.datasources\\.yaml.datasources[0].isDefault"
      value = "true"
    }
  ]
}
