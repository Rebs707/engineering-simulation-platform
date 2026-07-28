# Platform Architecture

## High-Level Architecture

```mermaid
flowchart TB
    Developer[Engineer] --> GitHub[GitHub Repository]
    GitHub --> Actions[GitHub Actions]

    Actions --> Fmt[Terraform Format]
    Actions --> Validate[Terraform Validate]
    Actions --> Plan[Terraform Plan]
    Plan --> Artifact[Plan Artifact]

    Terraform[Terraform Root Module] --> Backend[S3 Remote State]
    Terraform --> Locking[DynamoDB State Locking]
    Terraform --> AWS[AWS Platform]

    AWS --> Network[VPC and Networking]
    AWS --> IAM[IAM]
    AWS --> ECR[Amazon ECR]
    AWS --> EKS[Amazon EKS]

    Network --> Public[Public Subnets]
    Network --> Private[Private Subnets]
    Network --> IGW[Internet Gateway]
    Network --> Routes[Route Tables]
    Network --> SG[Security Groups]

    EKS --> Namespaces[Kubernetes Namespaces]
    EKS --> Metrics[Metrics Server]
    EKS --> ALB[AWS Load Balancer Controller]
    EKS --> ESO[External Secrets]
    EKS --> Autoscaler[Cluster Autoscaler]
    EKS --> Prometheus[Prometheus]
    EKS --> Grafana[Grafana]
    EKS --> ArgoCD[Argo CD]

    IAM --> ALB
    IAM --> ESO
    IAM --> Autoscaler

    Prometheus --> Grafana
    GitHub --> ArgoCD
```

## Provisioning Flow

```mermaid
sequenceDiagram
    participant Engineer
    participant GitHub
    participant Actions as GitHub Actions
    participant Terraform
    participant Backend as S3 and DynamoDB
    participant AWS
    participant EKS

    Engineer->>GitHub: Push or open pull request
    GitHub->>Actions: Trigger Terraform CI
    Actions->>Terraform: Format, initialize, validate, and plan
    Terraform->>Backend: Read state and acquire lock
    Terraform->>AWS: Calculate infrastructure changes
    Actions-->>Engineer: Publish CI result and plan artifact
    Engineer->>Terraform: Approve deployment
    Terraform->>AWS: Provision infrastructure
    AWS->>EKS: Create Kubernetes platform
    EKS-->>Engineer: Platform services available
```

## Dependency Layers

```text
Layer 1: Remote State
  S3 bucket
  DynamoDB lock table

Layer 2: AWS Foundation
  VPC
  Subnets
  Internet gateway
  Route tables
  Security groups
  IAM
  ECR

Layer 3: Kubernetes Compute
  EKS control plane
  EKS worker nodes
  OIDC provider

Layer 4: Platform Services
  Namespaces
  Metrics Server
  AWS Load Balancer Controller
  External Secrets
  Cluster Autoscaler

Layer 5: Observability and Delivery
  Prometheus
  Grafana
  Argo CD

Layer 6: Automation
  GitHub Actions
  Terraform validation
  Terraform plan artifacts
```

## Trust and Identity Flow

```mermaid
flowchart LR
    Pod[Kubernetes Service Account] --> OIDC[EKS OIDC Provider]
    OIDC --> IAMRole[AWS IAM Role]
    IAMRole --> AWSService[AWS API]

    ALBPod[AWS Load Balancer Controller] --> Pod
    ESOPod[External Secrets Operator] --> Pod
    CAPod[Cluster Autoscaler] --> Pod
```

IRSA reduces the need for long-lived AWS credentials inside Kubernetes workloads.

## Observability Flow

```mermaid
flowchart LR
    Workloads[Kubernetes Workloads] --> Metrics[Metrics Endpoints]
    Metrics --> Prometheus[Prometheus]
    Prometheus --> Grafana[Grafana Dashboards]
    Cluster[EKS Cluster Metrics] --> Prometheus
```

## GitOps Flow

```mermaid
flowchart LR
    AppRepo[Application Repository] --> ArgoCD[Argo CD]
    ArgoCD --> Cluster[EKS Cluster]
    Cluster --> Desired[Desired State]
    Drift[Configuration Drift] --> ArgoCD
    ArgoCD --> Reconcile[Reconciliation]
    Reconcile --> Cluster
```

## Design Principles

- Reusable Terraform modules
- Clear separation between bootstrap and environment stacks
- Private EKS workload placement
- IAM Roles for Service Accounts
- Encrypted and versioned Terraform state
- Declarative Kubernetes platform services
- Internal service exposure by default
- Automated validation before deployment
- GitOps-ready application delivery
