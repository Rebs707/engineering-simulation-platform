# Internet Gateway Module

## Purpose

Creates and attaches an Internet Gateway to an existing Amazon VPC.

## Resources Created

- Amazon EC2 Internet Gateway
- VPC attachment
- Standard resource tags

## Inputs

| Name | Description | Type | Default |
|---|---|---|---|
| `vpc_id` | VPC ID receiving the gateway | `string` | Required |
| `name` | Internet Gateway name | `string` | `engineering-simulation-igw` |
| `tags` | Additional resource tags | `map(string)` | `{}` |

## Outputs

| Name | Description |
|---|---|
| `internet_gateway_id` | Internet Gateway ID |
| `internet_gateway_arn` | Internet Gateway ARN |

## Example

```hcl
module "internet_gateway" {
  source = "../../modules/internet-gateway"

  vpc_id = module.vpc.vpc_id
  name   = "engineering-simulation-dev-igw"

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
aws ec2 describe-internet-gateways --internet-gateway-ids <internet-gateway-id>
```

## Operational Notes

- The Internet Gateway enables public internet routing for associated public subnets.
- Route tables must explicitly direct outbound traffic to this gateway.
- Private subnet traffic should use a NAT Gateway instead.
