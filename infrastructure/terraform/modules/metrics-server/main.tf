resource "helm_release" "metrics_server" {
  name       = var.release_name
  repository = "https://kubernetes-sigs.github.io/metrics-server/"
  chart      = "metrics-server"
  namespace  = var.namespace
  version    = var.chart_version

  create_namespace = false
  wait             = true
  timeout          = 300

  values = [
    yamlencode({
      replicas = var.replica_count

      args = [
        "--kubelet-preferred-address-types=InternalIP,ExternalIP,Hostname",
        "--kubelet-use-node-status-port"
      ]

      resources = {
        requests = {
          cpu    = "100m"
          memory = "200Mi"
        }
        limits = {
          cpu    = "200m"
          memory = "300Mi"
        }
      }
    })
  ]
}
