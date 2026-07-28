# Engineering Simulation Platform

[![Terraform](https://img.shields.io/badge/Terraform-1.6%2B-7B42BC?logo=terraform&logoColor=white)](https://developer.hashicorp.com/terraform)
[![AWS](https://img.shields.io/badge/AWS-Cloud_Platform-232F3E?logo=amazonaws&logoColor=white)](https://aws.amazon.com/)
[![Amazon EKS](https://img.shields.io/badge/Amazon-EKS-FF9900?logo=amazoneks&logoColor=white)](https://aws.amazon.com/eks/)
[![Kubernetes](https://img.shields.io/badge/Kubernetes-Platform-326CE5?logo=kubernetes&logoColor=white)](https://kubernetes.io/)
[![GitHub Actions](https://img.shields.io/badge/GitHub_Actions-CI-2088FF?logo=githubactions&logoColor=white)](https://github.com/features/actions)
[![Argo CD](https://img.shields.io/badge/Argo_CD-GitOps-EF7B4D?logo=argo&logoColor=white)](https://argo-cd.readthedocs.io/)
[![Prometheus](https://img.shields.io/badge/Prometheus-Observability-E6522C?logo=prometheus&logoColor=white)](https://prometheus.io/)
[![Grafana](https://img.shields.io/badge/Grafana-Dashboards-F46800?logo=grafana&logoColor=white)](https://grafana.com/)

> A production-style AWS platform engineering simulation built with Terraform, Amazon EKS, Kubernetes controllers, GitOps, observability, remote state, security integrations, and continuous infrastructure validation.

## Overview

The Engineering Simulation Platform models how a modern platform engineering team provisions, secures, observes, and operates a Kubernetes environment on AWS.

Rather than demonstrating isolated cloud services, this repository brings together the major layers of a production platform:

- AWS networking and foundational infrastructure
- Modular Infrastructure as Code
- Amazon EKS
- IAM and workload identity
- Kubernetes platform controllers
- Monitoring and visualization
- GitOps-based delivery
- Remote Terraform state
- Continuous infrastructure validation
- Operational and incident-response simulations

The repository is designed both as a technical implementation and as a hands-on environment for practising real platform engineering responsibilities.

## Project Objectives

This project demonstrates how to:

- Build reusable AWS infrastructure using modular Terraform
- Provision a network foundation for Kubernetes workloads
- Create and configure an Amazon EKS environment
- Integrate Kubernetes workloads with AWS IAM
- Install essential Kubernetes platform services
- Implement monitoring with Prometheus and Grafana
- Establish GitOps delivery with Argo CD
- Manage Terraform state securely and remotely
- Validate infrastructure changes through GitHub Actions
- Simulate production operations, incidents, migrations, and troubleshooting

## Architecture

```text
Developer
    |
    v
GitHub Repository
    |
    v
GitHub Actions
    |
    +--> terraform fmt
    +--> terraform init
    +--> terraform validate
    +--> terraform plan
    |
    v
Terraform
    |
    +--> Remote State
    |     +--> Amazon S3
    |     +--> DynamoDB Locking
    |
    v
AWS Platform
    |
    +--> VPC
    |     +--> Public Subnets
    |     +--> Private Subnets
    |     +--> Internet Gateway
    |     +--> NAT and Routing
    |     +--> Security Groups
    |
    +--> IAM
    |
    +--> Amazon ECR
    |
    +--> Amazon EKS
          |
          +--> Kubernetes Namespaces
          +--> Metrics Server
          +--> AWS Load Balancer Controller
          +--> External Secrets Operator
          +--> Cluster Autoscaler
          +--> Prometheus
          +--> Grafana
          +--> Argo CD
