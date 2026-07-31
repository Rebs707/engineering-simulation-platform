# Grafana Module

## Purpose

Installs Grafana through Helm and configures Prometheus as its default data source.

## Terraform Components

### Resources

- `random_password.grafana_admin`
- `helm_release.grafana`

## Inputs

- `namespace`
- `release_name`
- `chart_version`
- `storage_size`
- `prometheus_url`

## Outputs

- `release_name`
- `namespace`
- `admin_password`

## Validation

```bash
terraform fmt -check
terraform validate
```

## Operational Notes

- Review the module variables before use in another environment.
- Validate provider access and dependency ordering before deployment.
- Apply changes through version control and the standard review workflow.
