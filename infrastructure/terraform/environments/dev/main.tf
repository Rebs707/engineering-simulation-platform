module "vpc" {
  source = "../../modules/vpc"

  vpc_name = "engineering-simulation-dev"
  vpc_cidr = "10.0.0.0/16"
}
