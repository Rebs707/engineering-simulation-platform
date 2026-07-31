module "vpc" {
  source = "../../modules/vpc"

  vpc_name = "engineering-simulation-qa"
  vpc_cidr = "10.0.0.0/16"
}

module "subnets" {
  source = "../../modules/subnets"

  vpc_id               = module.vpc.vpc_id
  public_subnet_cidrs  = var.public_subnet_cidrs
  private_subnet_cidrs = var.private_subnet_cidrs
  availability_zones   = var.availability_zones
}

module "internet_gateway" {
  source = "../../modules/internet-gateway"

  vpc_id = module.vpc.vpc_id
}

module "iam" {
  source = "../../modules/iam"
}


module "ecr" {
  source = "../../modules/ecr"
}

module "eks" {
  source = "../../modules/eks"

  cluster_name     = "engineering-simulation-qa"
  cluster_role_arn = module.iam.cluster_role_arn
  node_role_arn    = module.iam.node_role_arn
  subnet_ids       = module.subnets.private_subnet_ids
}

module "namespaces" {
  source = "../../modules/namespaces"

  environment = "dev"

  depends_on = [module.eks]
}

module "metrics_server" {
  source = "../../modules/metrics-server"

  namespace = "platform-system"

  depends_on = [module.namespaces]
}

module "aws_load_balancer_controller" {
  source = "../../modules/aws-load-balancer-controller"

  cluster_name              = module.eks.cluster_name
  cluster_oidc_provider_arn = module.eks.cluster_oidc_provider_arn
  cluster_oidc_issuer_url   = module.eks.cluster_oidc_issuer_url
  aws_region                = var.aws_region
  vpc_id                    = module.vpc.vpc_id
  iam_policy_arn            = module.iam.aws_load_balancer_controller_policy_arn

  depends_on = [module.namespaces]
}

module "external_secrets" {
  source = "../../modules/external-secrets"

  namespace                 = "external-secrets"
  cluster_oidc_provider_arn = module.eks.cluster_oidc_provider_arn
  cluster_oidc_issuer_url   = module.eks.cluster_oidc_issuer_url
  iam_role_name             = "engineering-simulation-qa-external-secrets"
  secret_arns               = ["*"]
  kms_key_arns              = ["*"]

  depends_on = [module.namespaces]
}

module "cluster_autoscaler" {

  source = "../../modules/cluster-autoscaler"



  cluster_name = module.eks.cluster_name

  cluster_oidc_provider_arn = module.eks.cluster_oidc_provider_arn

  cluster_oidc_issuer_url = module.eks.cluster_oidc_issuer_url

  aws_region = var.aws_region

  iam_role_name = "engineering-simulation-qa-cluster-autoscaler"



  depends_on = [module.metrics_server]

}

module "prometheus" {
  source = "../../modules/prometheus"

  depends_on = [
    module.cluster_autoscaler
  ]
}

module "grafana" {

  source = "../../modules/grafana"



  prometheus_url = "http://prometheus-server.monitoring.svc.cluster.local"



  depends_on = [

    module.prometheus

  ]

}
