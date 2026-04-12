# GitOps Kubernetes Hardening and Policy Control

This repo teaches how to secure a Kubernetes platform with policy-as-code and GitOps.

## What you will practice

- Writing Kubernetes base manifests
- Applying security policies before runtime
- Using Sealed Secrets for safer secret handling
- Syncing deployments through Argo CD
- Explaining hardening choices in an interview

## Tech stack

- Python
- Kubernetes
- Kyverno
- Sealed Secrets
- Argo CD

## Folder guide

- `app/server.py` is the sample workload
- `k8s/base/` contains the namespace, deployment, service, and network policy
- `policies/` contains Kyverno examples
- `secrets/app-sealedsecret.yaml` shows the sealed-secret pattern
- `argocd/application.yaml` defines the GitOps application
- `.github/workflows/policy-check.yml` is a placeholder CI validation workflow

## How the hardening flow works

1. Build a small app.
2. Apply Kubernetes base manifests.
3. Enforce security policies before the workload is admitted.
4. Store secrets in sealed form.
5. Let Argo CD sync only the approved state.

## Useful commands

```bash
kubectl apply -k k8s/base
kubectl apply -f policies/no-privileged.yaml
kubectl apply -f policies/no-latest-tag.yaml
kubectl apply -f policies/resource-limits.yaml
kubectl apply -f argocd/application.yaml
```

## Interview talking points

- Security is enforced before the pod reaches runtime.
- GitOps gives auditability and predictable deployments.
- NetworkPolicy, resource limits, and non-root containers all reduce blast radius.
- Sealed Secrets let you keep secret workflows version-controlled without storing plain text.

## Practice tasks

- Add a policy that blocks hostPath volumes.
- Add namespace labels and stricter network policies.
- Replace the placeholder workflow with real Kyverno tests.
- Add a second environment overlay for staging.
