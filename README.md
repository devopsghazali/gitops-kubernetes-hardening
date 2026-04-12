# GitOps Kubernetes Hardening and Policy Control

A project that shows how to keep a Kubernetes platform secure and consistent with policy-as-code.

## Stack
- Kubernetes
- Argo CD
- Kyverno or Gatekeeper
- Sealed Secrets
- Trivy
- GitHub

## What this repo covers
- Admission policy enforcement
- Secret encryption before Git commits
- GitOps deployment of compliant manifests
- Security checks during delivery

## Interview talking points
- Unsafe workloads are blocked before they reach the cluster
- Secrets stay encrypted in Git
- GitOps keeps changes auditable

## Quick flow
1. Define the security policy.
2. Encrypt secrets.
3. Commit the manifests to Git.
4. Let Argo CD sync the approved state.
5. Verify the workload stays compliant.
