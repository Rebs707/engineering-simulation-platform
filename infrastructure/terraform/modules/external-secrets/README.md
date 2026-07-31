# External Secrets Module

## Purpose

Installs External Secrets Operator and creates its IRSA IAM role and access policy.

## Terraform Components

### Resources

- `aws_iam_role.external_secrets`
- `aws_iam_role_policy.external_secrets`
- `helm_release.external_secrets`

### Data Sources

- `aws_iam_policy_document.assume_role`
- `aws_iam_policy_document.external_secrets`

## Inputs

- `namespace`
- `release_name`
- `chart_version`
- `service_account_name`
- `cluster_oidc_provider_arn`
- `cluster_oidc_issuer_url`
- `iam_role_name`
- `secret_arns`
- `kms_key_arns`

## Outputs

- `release_name`
- `namespace`
- `service_account_name`
- `iam_role_arn`

## Validation

```bash
terraform fmt -check
terraform validate
```

## Operational Notes

- Review the module variables before use in another environment.
- Validate provider access and dependency ordering before deployment.
- Apply changes through version control and the standard review workflow.
