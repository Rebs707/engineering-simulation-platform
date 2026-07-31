# IAM Module

## Purpose

Creates the IAM roles and policies required by the Amazon EKS control plane, managed worker nodes, Amazon ECR access, and AWS Load Balancer Controller.

## Resources Created

- EKS control-plane IAM role
- EKS managed-node-group IAM role
- Amazon EKS cluster policy attachment
- Amazon EKS worker-node policy attachment
- Amazon EKS CNI policy attachment
- Amazon ECR read-only policy attachment
- AWS Load Balancer Controller IAM policy

## Inputs

| Name | Description | Type | Default |
|---|---|---|---|
| `cluster_role_name` | EKS control-plane IAM role name | `string` | `engineering-simulation-eks-cluster-role` |
| `node_role_name` | EKS worker-node IAM role name | `string` | `engineering-simulation-eks-node-role` |
| `load_balancer_policy_name` | Load Balancer Controller policy name | `string` | `engineering-simulation-aws-load-balancer-controller` |

## Outputs

| Name | Description |
|---|---|
| `cluster_role_arn` | EKS control-plane role ARN |
| `cluster_role_name` | EKS control-plane role name |
| `node_role_arn` | EKS node role ARN |
| `node_role_name` | EKS node role name |
| `aws_load_balancer_controller_policy_arn` | Load Balancer Controller policy ARN |

## Example

```hcl
module "iam" {
  source = "../../modules/iam"

  cluster_role_name           = "engineering-simulation-dev-eks-cluster"
  node_role_name              = "engineering-simulation-dev-eks-nodes"
  load_balancer_policy_name   = "engineering-simulation-dev-alb-controller"
}
```

## Validation

```bash
terraform fmt -check
terraform validate
aws iam get-role --role-name <role-name>
aws iam list-attached-role-policies --role-name <role-name>
```

## Security Notes

- The EKS control-plane role trusts only the EKS service.
- The worker-node role trusts only the EC2 service.
- Kubernetes workload permissions should use IRSA rather than the node role.
- Custom policies should follow least-privilege principles.
