# Aws Load Balancer Controller Module

## Purpose

Installs the AWS Load Balancer Controller and creates its IRSA IAM role.

## Terraform Components

### Resources

- `helm_release.controller`
- `aws_iam_role.controller`
- `aws_iam_role_policy_attachment.controller`

### Data Sources

- `aws_iam_policy_document.assume_role`

## Inputs

- `namespace`
- `service_account_name`
- `release_name`
- `chart_version`
- `cluster_name`
- `cluster_oidc_provider_arn`
- `cluster_oidc_issuer_url`
- `aws_region`
- `vpc_id`
- `iam_policy_arn`

## Outputs

- `iam_role_arn`
- `iam_role_name`

## Validation

```bash
terraform fmt -check
terraform validate
```

## Operational Notes

- Review the module variables before use in another environment.
- Validate provider access and dependency ordering before deployment.
- Apply changes through version control and the standard review workflow.
