# VPC Module

## Purpose

Creates the foundational Amazon VPC used by the Engineering Simulation Platform.

## Resources Created

- Amazon VPC
- DNS support configuration
- DNS hostname configuration
- Standard resource tags

## Inputs

| Name | Description | Type | Default |
|---|---|---|---|
| `vpc_name` | Name assigned to the VPC | `string` | Required |
| `vpc_cidr` | IPv4 CIDR block assigned to the VPC | `string` | Required |
| `enable_dns_support` | Enables VPC DNS resolution | `bool` | `true` |
| `enable_dns_hostnames` | Enables DNS hostnames | `bool` | `true` |
| `tags` | Additional resource tags | `map(string)` | `{}` |

## Outputs

| Name | Description |
|---|---|
| `vpc_id` | VPC ID |
| `vpc_arn` | VPC ARN |
| `vpc_cidr` | VPC CIDR block |
| `default_security_group_id` | Default security-group ID |
| `default_route_table_id` | Default route-table ID |

## Example

```hcl
module "vpc" {
  source = "../../modules/vpc"

  vpc_name = "engineering-simulation-dev"
  vpc_cidr = "10.0.0.0/16"

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
aws ec2 describe-vpcs --vpc-ids <vpc-id>
```

## Operational Notes

- DNS support and DNS hostnames are enabled by default for EKS compatibility.
- The VPC CIDR should not overlap with connected networks.
- Subnets, gateways, routes, and security groups are managed by separate modules.
