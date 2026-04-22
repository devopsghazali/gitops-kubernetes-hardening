# 🚀 GitOps Kubernetes Hardening Project - Complete Tutorial (Step by Step)

---

# 📌 Overview

Is project mein humne Kubernetes ko secure banaya using:

* 🔐 Kyverno (Policy Enforcement)
* 🔑 Sealed Secrets (Secure Secret Management)
* 🔄 ArgoCD (GitOps Deployment)
* ☸️ Kubernetes (Core Platform)

👉 Goal: Secure-by-default Kubernetes platform banana jahan insecure workloads run hi na ho saken.

---

# 🧠 Architecture Flow

```
Developer → Git Push → CI Policy Check → ArgoCD Sync → Kubernetes
                                     ↓
                           Kyverno Admission Control
                                     ↓
                        SealedSecrets Controller decrypts secrets
```

---

# 📁 Repo Structure Samajh

```
app/               → Sample Python application
k8s/base/          → Kubernetes manifests (Deployment, Service, NS)
policies/          → Kyverno security policies
secrets/           → SealedSecrets encrypted secrets
argocd/            → ArgoCD application config
.github/workflows/ → CI pipeline checks
```

---

# ⚙️ STEP 1: Application Setup

👉 Humne ek simple Python app banaya:

* Docker image build ki
* Kubernetes deployment ready ki

```bash
docker build -t app:v1 .
```

---

# ☸️ STEP 2: Kubernetes Base Deployment

👉 k8s/base folder mein:

* Namespace
* Deployment
* Service
* NetworkPolicy

Apply kiya:

```bash
kubectl apply -f k8s/base/
```

---

# 🔐 STEP 3: Sealed Secrets (IMPORTANT)

## 🧠 Concept

Normal Secret ❌ (unsafe in Git)
SealedSecret ✅ (encrypted safe in Git)

---

## ⚙️ Kaise kaam karta hai?

### Step 1: Normal secret

```
apiVersion: v1
kind: Secret
stringData:
  PORT: "8080"
```

### Step 2: kubeseal encrypt karta hai

```bash
kubeseal --format yaml < secret.yaml > sealedsecret.yaml
```

👉 Yeh kya karta hai:

* Cluster ke PUBLIC KEY use karta hai
* Secret ko encrypt karta hai
* Output Git mein safe hota hai

---

## 🔄 Flow

```
Secret → kubeseal → SealedSecret → Git → Cluster decrypt → Secret
```

---

## ⚠️ Important Rule

👉 Same cluster jahan decrypt hoga wahi se seal karna hota hai
warna error aata hai:

"no key could decrypt secret"

---

# 🛡️ STEP 4: Kyverno Policies

## 🧠 Kyverno kya karta hai?

👉 Kubernetes Admission Controller hai jo runtime pe rules enforce karta hai

---

## 🔍 Example Policies:

### 1. Privileged containers block

```
privileged: false mandatory
```

### 2. Resource limits required

```
cpu + memory requests & limits must exist
```

### 3. No latest image tag

```
image:latest ❌ not allowed
```

---

## ⚙️ Kaise kaam karta hai?

```
kubectl apply → API Server → Kyverno webhook → allow/deny
```

---

# 🔄 STEP 5: GitOps with ArgoCD

## 🧠 Concept

👉 Git = single source of truth
👉 ArgoCD automatically sync karta hai cluster ko

---

## ⚙️ Flow

```
Git commit → ArgoCD detects → Kubernetes sync → Deploy
```

---

# 🧪 STEP 6: CI Pipeline

👉 GitHub Actions use kiya:

* Policy validation
* Manifest checks
* Security enforcement

---

# 🚀 STEP 7: Deployment & Access

## Apply manifests:

```
kubectl apply -f argocd/application.yaml
```

## Check pods:

```
kubectl get pods -n hardening-demo
```

## Port Forward:

```
kubectl port-forward svc/hardening-demo 9090:80
```

---

# 🔍 Real Issues We Faced

## ❌ Issue 1: SealedSecret decrypt error

✔ Reason: wrong cluster key
✔ Fix: re-seal using correct cluster

---

## ❌ Issue 2: Pod CreateContainerConfigError

✔ Reason: secret missing
✔ Fix: sealed secret correct apply

---

## ❌ Issue 3: Port not accessible

✔ Reason: pod not running
✔ Fix: fix secret → pod becomes Ready

---

# 🧠 Key Learnings

✔ kubeseal = encrypt secrets using cluster public key
✔ Kyverno = admission-time security enforcement
✔ ArgoCD = GitOps automated deployment
✔ Kubernetes = runtime execution layer

---

# 🔥 Final Summary

👉 Humne ek secure Kubernetes platform banaya jahan:

* Insecure workloads block hote hain
* Secrets Git mein safe hain
* Deployments fully Git-controlled hain
* Policies runtime pe enforce hoti hain

---

# 🎯 One Line Conclusion

👉 "Ye project Kubernetes ko insecure se enterprise-grade secure platform
