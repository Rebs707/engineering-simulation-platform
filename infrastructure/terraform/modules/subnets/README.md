# Subnets Module

## Purpose

Creates public and private subnets across multiple Availability Zones within an existing VPC.

## Resources Created

- Public subnets with automatic public IP assignment
- Private subnets without automatic public IP assignment
- Standard subnet tags

## Inputs

| Name | Description | Type | Default |
|---|---|---|---|
| `vpc_id` | Parent VPC ID | `string` | Required |
| `public_subnet_cidrs` | Public subnet CIDR blocks | `list(string)` | Required |
| `private_subnet_cidrs` | Private subnet CIDR blocks | `list(string)` | Required |
| `availability_zones` | Availability Zones used for placement | `list(string)` | Required |
| `public_subnet_name_prefix` | Public subnet name prefix | `string` | `public` |
| `private_subnet_name_prefix` | Private subnet name prefix | `string` | `private` |
| `tags` | Additional subnet tags | `map(string)` | `{}` |

## Outputs

| Name | Description |
|---|---|
| `public_subnet_ids` | Public subnet IDs |
| `private_subnet_ids` | Private subnet IDs |
| `public_subnet_arns` | Public subnet ARNs |
| `private_subnet_arns` | Private subnet ARNs |

## Example

```hcl
module "subnets" {
  source = "../../modules/subnets"

  vpc_id               = module.vpc.vpc_id
  public_subnet_cidrs  = ["10.0.1.0/24", "10.0.2.0/24"]
  private_subnet_cidrs = ["10.0.11.0/24", "10.0.12.0/24"]
  availability_zones   = ["ap-south-1a", "ap-south-1b"]

  tags = {
    Environment = "dev"
    ManagedBy   = "Terraform"
  }
}
```

## Validation

```bash
terraform fmt -check
terraform validate
aws ec2 describe-subnets --filters Name=vpc-id,Values=<vpc-id>
```

## Operational Notes

- The number of CIDR blocks should align with the number of Availability Zones.
- Public subnets automatically assign public IP addresses at launch.
- Private subnets are intended for EKS worker nodes and internal workloads.
