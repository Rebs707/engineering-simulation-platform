# Route Tables Module

## Purpose

Creates public and private route tables and associates them with their corresponding subnet groups.

## Resources Created

- Public route table
- Private route table
- Default route to the Internet Gateway
- Default route to the NAT Gateway
- Public subnet route-table associations
- Private subnet route-table associations

## Inputs

| Name | Description | Type | Default |
|---|---|---|---|
| `vpc_id` | Parent VPC ID | `string` | Required |
| `internet_gateway_id` | Internet Gateway used by public routes | `string` | Required |
| `nat_gateway_id` | NAT Gateway used by private routes | `string` | Required |
| `public_subnet_ids` | Public subnet IDs | `list(string)` | Required |
| `private_subnet_ids` | Private subnet IDs | `list(string)` | Required |
| `public_route_table_name` | Public route-table name | `string` | `public-route-table` |
| `private_route_table_name` | Private route-table name | `string` | `private-route-table` |
| `tags` | Additional route-table tags | `map(string)` | `{}` |

## Outputs

| Name | Description |
|---|---|
| `public_route_table_id` | Public route-table ID |
| `private_route_table_id` | Private route-table ID |
| `public_route_table_arn` | Public route-table ARN |
| `private_route_table_arn` | Private route-table ARN |

## Example

```hcl
module "route_tables" {
  source = "../../modules/route-tables"

  vpc_id               = module.vpc.vpc_id
  internet_gateway_id  = module.internet_gateway.internet_gateway_id
  nat_gateway_id       = module.nat.nat_gateway_id
  public_subnet_ids    = module.subnets.public_subnet_ids
  private_subnet_ids   = module.subnets.private_subnet_ids
  public_route_table_name  = "engineering-simulation-dev-public"
  private_route_table_name = "engineering-simulation-dev-private"
}
```

## Validation

```bash
terraform fmt -check
terraform validate
aws ec2 describe-route-tables --filters Name=vpc-id,Values=<vpc-id>
```

## Operational Notes

- Public subnets route outbound internet traffic through the Internet Gateway.
- Private subnets route outbound internet traffic through the NAT Gateway.
- Route-table associations are created for every subnet supplied to the module.
