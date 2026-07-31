# Argocd Module

## Purpose

Installs Argo CD through Helm to provide GitOps-based Kubernetes application delivery.

## Terraform Components

### Resources

- `helm_release.argocd`

## Inputs

- `namespace`
- `release_name`
- `chart_version`
- `service_type`

## Outputs

- `release_name`
- `namespace`
- `server_service_name`

## Validation

```bash
terraform fmt -check
terraform validate
```

## Operational Notes

- Review the module variables before use in another environment.
- Validate provider access and dependency ordering before deployment.
- Apply changes through version control and the standard review workflow.
