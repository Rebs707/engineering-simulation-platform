# Cloud Policy

## Purpose

This policy defines the standards for provisioning, managing, and operating AWS cloud resources.

---

## Infrastructure

- All infrastructure must be provisioned using Terraform.
- Manual changes to production resources are prohibited.
- Infrastructure state must be stored remotely.

---

## Resource Management

All resources must:

- Use approved naming conventions
- Include mandatory resource tags
- Be assigned to the correct environment
- Follow least privilege principles

---

## Networking

- Private networking is preferred.
- Public exposure must be minimized.
- Security Groups must allow only required traffic.

---

## Monitoring

All production resources must publish metrics and logs to the organization's monitoring platform.

---

## Compliance

Cloud resources are reviewed periodically for security, cost optimization, and operational compliance.
