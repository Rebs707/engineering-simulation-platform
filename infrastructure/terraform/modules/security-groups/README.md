# Security Groups Module

## Purpose

Creates security groups for the EKS control plane, EKS worker nodes, Application Load Balancer, bastion host, and database workloads.

## Resources Created

- EKS control-plane security group
- EKS worker-node security group
- Application Load Balancer security group
- Bastion-host security group
- Database security group

## Inputs

| Name | Description | Type | Default |
|---|---|---|---|
| `vpc_id` | Parent VPC ID | `string` | Required |
| `bastion_allowed_cidrs` | CIDRs allowed to connect over SSH | `list(string)` | `[]` |
| `alb_allowed_cidrs` | CIDRs allowed to access ports 80 and 443 | `list(string)` | `["0.0.0.0/0"]` |
| `tags` | Additional security-group tags | `map(string)` | `{}` |

## Outputs

| Name | Description |
|---|---|
| `eks_control_plane_sg_id` | EKS control-plane security-group ID |
| `eks_nodes_sg_id` | EKS worker-node security-group ID |
| `alb_sg_id` | Load-balancer security-group ID |
| `bastion_sg_id` | Bastion-host security-group ID |
| `rds_sg_id` | Database security-group ID |

## Example

```hcl
module "security_groups" {
  source = "../../modules/security-groups"

  vpc_id                  = module.vpc.vpc_id
  bastion_allowed_cidrs   = ["203.0.113.10/32"]
  alb_allowed_cidrs       = ["0.0.0.0/0"]

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
aws ec2 describe-security-groups --filters Name=vpc-id,Values=<vpc-id>
```

## Security Notes

- Bastion SSH access is disabled by default because the allowed CIDR list is empty.
- Never use unrestricted SSH access such as `0.0.0.0/0`.
- ALB ingress is public by default and should be restricted when the application is internal.
- Database ingress rules should be added only for explicitly approved application sources.
- Security-group rules should follow least-privilege principles.
