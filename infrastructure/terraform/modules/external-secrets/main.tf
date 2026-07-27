resource "helm_release" "external_secrets" {
  name             = var.release_name
  repository       = "https://charts.external-secrets.io"
  chart            = "external-secrets"
  namespace        = var.namespace
  create_namespace = true
  version          = var.chart_version
  wait             = true
  timeout          = 600

  set = [
    {
      name  = "serviceAccount.create"
      value = "true"
    },
    {
      name  = "serviceAccount.name"
      value = var.service_account_name
    },
    {
      name  = "serviceAccount.annotations.eks\\.amazonaws\\.com/role-arn"
      value = aws_iam_role.external_secrets.arn
    }
  ]
}
