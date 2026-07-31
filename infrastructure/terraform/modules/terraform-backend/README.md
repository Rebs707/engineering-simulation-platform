# Terraform Backend Module

## Purpose

Creates the S3 bucket and DynamoDB table used for Terraform remote state and locking.

## Terraform Components

### Resources

- `aws_s3_bucket.terraform_state`
- `aws_s3_bucket_ownership_controls.terraform_state`
- `aws_s3_bucket_versioning.terraform_state`
- `aws_s3_bucket_server_side_encryption_configuration.terraform_state`
- `aws_s3_bucket_public_access_block.terraform_state`
- `aws_dynamodb_table.terraform_locks`

## Inputs

- `bucket_name`
- `lock_table_name`
- `environment`
- `tags`

## Outputs

- `bucket_name`
- `bucket_arn`
- `lock_table_name`

## Validation

```bash
terraform fmt -check
terraform validate
```

## Operational Notes

- Review the module variables before use in another environment.
- Validate provider access and dependency ordering before deployment.
- Apply changes through version control and the standard review workflow.
