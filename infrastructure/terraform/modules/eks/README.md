# Amazon EKS Module

## Purpose

Creates an Amazon EKS cluster, a managed worker-node group, and the IAM OIDC provider required for IRSA integrations.

## Resources Created

- Amazon EKS cluster
- Amazon EKS managed node group
- IAM OpenID Connect provider
- TLS certificate data source for the cluster issuer

## Inputs

| Name | Description | Type | Default |
|---|---|---|---|
| `cluster_name` | EKS cluster name | `string` | Required |
| `cluster_role_arn` | IAM role ARN for the control plane | `string` | Required |
| `node_role_arn` | IAM role ARN for worker nodes | `string` | Required |
| `subnet_ids` | Subnets used by the cluster and node group | `list(string)` | Required |
| `instance_types` | Worker-node EC2 instance types | `list(string)` | `["t3.medium"]` |
| `desired_size` | Desired worker-node count | `number` | `2` |
| `min_size` | Minimum worker-node count | `number` | `1` |
| `max_size` | Maximum worker-node count | `number` | `3` |

## Outputs

| Name | Description |
|---|---|
| `cluster_name` | EKS cluster name |
| `cluster_endpoint` | Kubernetes API endpoint |
| `cluster_certificate_authority` | Cluster certificate authority data |
| `cluster_oidc_provider_arn` | IAM OIDC provider ARN |
| `cluster_oidc_issuer_url` | Cluster OIDC issuer URL |
| `node_group_name` | Managed node-group name |

## Example

```hcl
module "eks" {
  source = "../../modules/eks"

  cluster_name     = "engineering-simulation-dev"
  cluster_role_arn = module.iam.cluster_role_arn
  node_role_arn    = module.iam.node_role_arn
  subnet_ids       = module.subnets.private_subnet_ids
  instance_types   = ["t3.medium"]
  desired_size     = 2
  min_size         = 1
  max_size         = 3
}
```

## Validation

```bash
terraform fmt -check
terraform validate
aws eks describe-cluster --name <cluster-name>
aws eks describe-nodegroup --cluster-name <cluster-name> --nodegroup-name <node-group-name>
```

## Operational Notes

- Private subnets are recommended for worker nodes.
- The OIDC provider enables IRSA for Kubernetes controllers.
- Production environments should use larger capacity and stronger availability settings.
