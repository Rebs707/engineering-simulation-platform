# NAT Gateway Module

## Purpose

Creates an AWS NAT Gateway in a public subnet so workloads in private subnets can initiate outbound internet connections without accepting unsolicited inbound traffic.

## Resources Created

- AWS NAT Gateway
- Association with an existing Elastic IP allocation
- Standard resource tags

## Inputs

| Name | Description | Type | Default |
|---|---|---|---|
| `public_subnet_id` | Public subnet containing the NAT Gateway | `string` | Required |
| `allocation_id` | Elastic IP allocation ID | `string` | Required |
| `name` | NAT Gateway name | `string` | `nat-gateway` |
| `tags` | Additional resource tags | `map(string)` | `{}` |

## Outputs

| Name | Description |
|---|---|
| `nat_gateway_id` | NAT Gateway ID |
| `nat_gateway_public_ip` | NAT Gateway public IP address |
| `nat_gateway_private_ip` | NAT Gateway private IP address |

## Example

```hcl
resource "aws_eip" "nat" {
  domain = "vpc"
}

module "nat" {
  source = "../../modules/nat"

  public_subnet_id = module.subnets.public_subnet_ids[0]
  allocation_id    = aws_eip.nat.id
  name             = "engineering-simulation-dev-nat"

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
aws ec2 describe-nat-gateways --nat-gateway-ids <nat-gateway-id>
```

## Operational Notes

- The Elastic IP must exist before the NAT Gateway is created.
- The NAT Gateway must be placed in a public subnet with internet-gateway routing.
- Private route tables must direct outbound traffic to the NAT Gateway.
- A single NAT Gateway is cost-efficient for simulations but is not highly available across Availability Zones.
