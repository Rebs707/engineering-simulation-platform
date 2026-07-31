# Metrics Server Module

## Purpose

Installs Kubernetes Metrics Server through Helm.

## Terraform Components

### Resources

- `helm_release.metrics_server`

## Inputs

- `release_name`
- `namespace`
- `chart_version`
- `replica_count`

## Outputs

- `release_name`
- `namespace`
- `status`

## Validation

```bash
terraform fmt -check
terraform validate
```

## Operational Notes

- Review the module variables before use in another environment.
- Validate provider access and dependency ordering before deployment.
- Apply changes through version control and the standard review workflow.
