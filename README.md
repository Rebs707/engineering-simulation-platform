# Engineering Simulation Platform

A production-style AWS platform engineering simulation built with Terraform, Amazon EKS, Kubernetes controllers, observability, GitOps, remote state, and CI automation.

## Overview

This repository models how a modern platform team provisions, secures, observes, and operates an AWS-based Kubernetes environment.

The platform includes:

- Modular Terraform infrastructure
- Amazon EKS
- IAM and IRSA integrations
- Kubernetes platform services
- Prometheus and Grafana observability
- Argo CD GitOps
- S3 remote state and DynamoDB locking
- GitHub Actions Terraform validation

## Architecture

```text
GitHub
  |
  v
GitHub Actions
  |
  v
Terraform
  |
  +--> Remote State: S3 + DynamoDB
  |
  v
AWS
  |
  +--> VPC
  |     +--> Public Subnets
  |     +--> Private Subnets
  |     +--> Internet Gateway
  |
  +--> IAM
  +--> ECR
  +--> EKS
        |
        +--> Namespaces
        +--> Metrics Server
        +--> AWS Load Balancer Controller
        +--> External Secrets
        +--> Cluster Autoscaler
        +--> Prometheus
        +--> Grafana
        +--> Argo CD
```

See [Architecture](docs/architecture.md) for the detailed diagram and component flow.

## Repository Structure

```text
.
├── .github/
│   └── workflows/
│       └── terraform.yml
├── docs/
│   └── architecture.md
└── infrastructure/
    └── terraform/
        ├── bootstrap/
        ├── environments/
        │   └── dev/
        └── modules/
            ├── argocd/
            ├── aws-load-balancer-controller/
            ├── cluster-autoscaler/
            ├── ecr/
            ├── eks/
            ├── external-secrets/
            ├── grafana/
            ├── iam/
            ├── internet-gateway/
            ├── metrics-server/
            ├── namespaces/
            ├── nat/
            ├── prometheus/
            ├── route-tables/
            ├── security-groups/
            ├── subnets/
            ├── terraform-backend/
            └── vpc/
```

## Platform Components

### AWS Foundation

- VPC and subnet architecture
- Internet gateway and routing
- IAM roles and policies
- Amazon ECR
- Amazon EKS
- Terraform state storage in S3
- Terraform state locking with DynamoDB

### Kubernetes Platform

- Dedicated namespaces
- Metrics Server
- AWS Load Balancer Controller
- External Secrets Operator
- Cluster Autoscaler

### Observability

- Prometheus for metrics collection
- Grafana for visualization
- Persistent monitoring storage
- Internal Prometheus data source integration

### GitOps

- Argo CD installed through Helm
- Declarative application delivery
- Drift visibility
- Self-healing foundation
- Scalable server and repository components

### CI Automation

The GitHub Actions workflow runs:

1. Terraform formatting checks
2. Terraform initialization
3. Terraform validation
4. Terraform plan
5. Terraform plan artifact upload

## Prerequisites

- Terraform 1.6 or later
- AWS CLI
- kubectl
- Helm
- An AWS account with sufficient permissions
- Configured AWS credentials

## Local Validation

```bash
terraform fmt -check -recursive infrastructure/terraform
terraform -chdir=infrastructure/terraform/environments/dev init -backend=false
terraform -chdir=infrastructure/terraform/environments/dev validate
```

## Backend Bootstrap

The remote backend is intentionally isolated from the development environment because Terraform cannot use an S3 backend before that backend exists.

Bootstrap the backend first, then configure the development environment to use the created S3 bucket and DynamoDB table.

```bash
terraform -chdir=infrastructure/terraform/modules/terraform-backend init
terraform -chdir=infrastructure/terraform/modules/terraform-backend plan
terraform -chdir=infrastructure/terraform/modules/terraform-backend apply
```

## Deployment Flow

```text
1. Bootstrap remote state
2. Configure backend settings
3. Initialize the dev environment
4. Review the Terraform plan
5. Apply AWS infrastructure
6. Validate the EKS cluster
7. Validate Kubernetes platform services
8. Validate Prometheus, Grafana, and Argo CD
```

## Security Design

- Workloads use IAM Roles for Service Accounts where applicable
- Terraform state is encrypted and versioned
- Public access to the state bucket is blocked
- DynamoDB locking prevents concurrent state modification
- Secrets are integrated through External Secrets
- Kubernetes services default to internal exposure unless explicitly changed

## Validation Status

The repository has passed:

- `terraform fmt -check`
- `terraform init -backend=false`
- `terraform validate`
- Provider dependency validation
- Placeholder scans
- Clean Git working-tree verification

## Planned Operational Simulation

After deployment, this platform becomes the foundation for a 20-day production operations simulation covering:

- Operational tickets
- Kubernetes troubleshooting
- Terraform changes
- Monitoring and alert response
- IAM and secrets incidents
- VCP-to-AWS migration scenarios
- Disaster recovery
- Performance and capacity investigations
- Change management
- Root-cause analysis
- Interview-style production scenarios

## Project Purpose

This project demonstrates practical capability across cloud infrastructure, platform engineering, Kubernetes operations, GitOps, observability, automation, security, and production support.
