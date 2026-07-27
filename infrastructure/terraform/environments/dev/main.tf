module "vpc" {
  source = "../../modules/vpc"

  vpc_name = "engineering-simulation-dev"
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
