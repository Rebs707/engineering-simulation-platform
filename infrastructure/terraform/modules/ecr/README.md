# Amazon ECR Module

## Purpose

Creates an Amazon Elastic Container Registry repository for application container images.

## Resources Created

- Amazon ECR repository
- Image vulnerability scanning configuration

## Inputs

| Name | Description | Type | Default |
|---|---|---|---|
| `repository_name` | ECR repository name | `string` | `engineering-simulation-app` |
| `image_tag_mutability` | Image-tag mutability setting | `string` | `MUTABLE` |
| `scan_on_push` | Enables vulnerability scanning on push | `bool` | `true` |

## Outputs

| Name | Description |
|---|---|
| `repository_url` | Repository URL used for Docker image pushes and pulls |
| `repository_arn` | ARN of the ECR repository |
| `repository_name` | Name of the ECR repository |

## Example

```hcl
module "ecr" {
  source = "../../modules/ecr"

  repository_name     = "engineering-simulation-dev-app"
  image_tag_mutability = "IMMUTABLE"
  scan_on_push         = true
}
```

## Validation

```bash
terraform fmt -check
terraform validate
aws ecr describe-repositories
```

## Security Notes

- Image scanning is enabled by default.
- Production environments should normally use immutable image tags.
- Repository access should be controlled through IAM policies.
