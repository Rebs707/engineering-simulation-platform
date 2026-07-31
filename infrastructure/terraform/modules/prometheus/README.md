# Prometheus Module

## Purpose

Installs Prometheus through Helm with persistent metric storage.

## Terraform Components

### Resources

- `helm_release.prometheus`

## Inputs

- `namespace`
- `release_name`
- `chart_version`
- `storage_size`

## Outputs

- `release_name`
- `namespace`

## Validation

```bash
terraform fmt -check
terraform validate
```

## Operational Notes

- Review the module variables before use in another environment.
- Validate provider access and dependency ordering before deployment.
- Apply changes through version control and the standard review workflow.
