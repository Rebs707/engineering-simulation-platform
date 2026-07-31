# Cluster Autoscaler Module

## Purpose

Installs Kubernetes Cluster Autoscaler and creates its IRSA IAM permissions.

## Terraform Components

### Resources

- `helm_release.cluster_autoscaler`
- `aws_iam_role.cluster_autoscaler`
- `aws_iam_role_policy.cluster_autoscaler`

### Data Sources

- `aws_iam_policy_document.assume_role`
- `aws_iam_policy_document.cluster_autoscaler`

## Inputs

- `namespace`
- `service_account_name`
- `release_name`
- `chart_version`
- `cluster_name`
- `cluster_oidc_provider_arn`
- `cluster_oidc_issuer_url`
- `aws_region`
- `iam_role_name`

## Outputs

- `release_name`
- `namespace`
- `iam_role_arn`
- `service_account_name`

## Validation

```bash
terraform fmt -check
terraform validate
```

## Operational Notes

- Review the module variables before use in another environment.
- Validate provider access and dependency ordering before deployment.
- Apply changes through version control and the standard review workflow.
