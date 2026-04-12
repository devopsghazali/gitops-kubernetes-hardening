# GitOps Kubernetes Hardening and Policy Control

This repo shows how to secure a Kubernetes platform with policy-as-code and GitOps.

## What is inside

- A small sample app
- Kubernetes base manifests
- Kyverno policy examples
- A sealed secret sample
- An Argo CD application manifest
- A policy validation workflow

## Main files

- `app/server.py`
- `k8s/base/deployment.yaml`
- `k8s/base/networkpolicy.yaml`
- `policies/no-privileged.yaml`
- `policies/no-latest-tag.yaml`
- `policies/resource-limits.yaml`
- `argocd/application.yaml`
