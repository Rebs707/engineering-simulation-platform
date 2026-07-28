# Security Policy

## Purpose

This policy establishes the security standards for the Engineering Simulation Platform.

---

## Identity and Access Management

- Least privilege access is mandatory.
- IAM roles are preferred over long-lived credentials.
- Multi-factor authentication is required for privileged users.

---

## Secrets Management

- Secrets must never be stored in source code.
- Sensitive information should be managed through approved secret management solutions.

---

## Vulnerability Management

Infrastructure and container images should be scanned regularly for known vulnerabilities.

---

## Logging and Auditing

Security events must be logged and retained for audit purposes.

---

## Incident Response

Security incidents must be investigated, documented, and remediated according to established operational procedures.
