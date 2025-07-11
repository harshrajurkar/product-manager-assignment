# 📦 Product Manager Assignment – README

## 🙋‍♂️ Overview:
This project contains solutions for 3 key problems:

1. Designing a vulnerability scanner dashboard  
2. Running a Kubernetes cluster security scan  
3. Building & deploying a GoLang app using Docker and Kubernetes  

It demonstrates both technical implementation (cloud, K8s, Docker) and product thinking (dashboard, UX, reporting).

---

## 🧩 Problem 1: Product Requirements & Wireframes

### 🎯 Goal:
Create a product requirements document (PRD) and design low-fidelity wireframes for a vulnerability scanning dashboard.

### 🛠️ Tools Used:
- Markdown (for PRD)
- AWS, Docker, Kubernetes
- Kubescape + ARMO Cloud Dashboard (for wireframes and real-time view)

### ✅ Steps:
- Wrote a `PRD.md` file with:
  - Title
  - Problem Statement
  - Features
  - Target Users
  - Success Metrics
- Created wireframes for:
  - Dashboard view
  - Image detail view
- Added a **real screenshot** from Kubescape's dashboard (PNG) for realism.

### 📁 Files:
```
Problem-1-Product-Requirements/
├── PRD.md
├── wireframes/
   ├── dashboard.png         ← Real dashboard screenshot (from ARMO)
   └── image-detail.png      ← Concept view or mock UI

```

---

## ⚙️ Problem 2: Kubernetes Security Scan

### 🎯 Goal:
Perform a real security scan on a Kubernetes cluster and export the scan result.

### 🛠️ Tools Used:
- Kubescape (CLI & Operator)
- AWS EKS (Elastic Kubernetes Service)
- EC2 instance (for running kubectl)
- ARMO Cloud (to view a beautiful compliance dashboard)

### ✅ Steps:
1. Created an EKS cluster using `eksctl`:
    ```bash
    eksctl create cluster --name kubescape-cluster --region ap-south-1
    ```
2. Installed Kubescape Operator via Helm:
    ```bash
    helm repo add kubescape https://kubescape.github.io/helm-charts/
    helm upgrade --install kubescape kubescape/kubescape-operator -n kubescape       --create-namespace       --set clusterName=<your-cluster-name>       --set account=<your-armo-account-id>       --set accessKey=<your-access-key>       --set server=api.armosec.io
    ```
3. Ran the scan using CLI.
4. Exported results to `kubescape-findings.json`:
    ```bash
    kubescape scan --submit --format json --output kubescape-findings.json
    ```
5. Visualised the scan in ARMO Cloud UI and took a screenshot for the wireframe.

### 📁 Files:
```
Problem-2-Kubernetes-Scan/
└── kubescape-findings.json     ← Actual scan result with real vulnerabilities
```

---

## 💻 Problem 3: GoLang App in Kubernetes

### 🎯 Goal:
Create a basic Go app that shows the current date/time and deploy it on Kubernetes with 2 replicas, publicly exposed.

### 🛠️ Tools Used:
- GoLang – for writing the app
- Docker – for containerization
- DockerHub – for hosting the image
- Kubernetes – for deploying the app
- AWS EKS + kubectl – real deployment
- EC2 – control machine for running commands

### ✅ Steps:

#### 🧑‍💻 1. Wrote the GoLang App:
```go
package main

import (
  "fmt"
  "net/http"
  "time"
)

func handler(w http.ResponseWriter, r *http.Request) {
  fmt.Fprintf(w, "Current Date and Time: %s", time.Now().Format(time.RFC1123))
}

func main() {
  http.HandleFunc("/", handler)
  fmt.Println("Server running on port 8080")
  http.ListenAndServe(":8080", nil)
}
```

#### 🐳 2. Dockerized it – Dockerfile
```Dockerfile
FROM golang:1.20
WORKDIR /app
COPY main.go .
RUN go build -o main .
CMD ["./main"]
```

**Build & Push to DockerHub:**
```bash
docker build -t <docker_username>/time-app .
docker push <docker_username>/time-app
```

#### ☸️ 3. Kubernetes Manifests

**deployment.yaml**
```yaml
apiVersion: apps/v1
kind: Deployment
metadata:
  name: time-app
spec:
  replicas: 2
  selector:
    matchLabels:
      app: time-app
  template:
    metadata:
      labels:
        app: time-app
    spec:
      containers:
      - name: time-app
        image: <docker_username>/time-app
        ports:
        - containerPort: 8080
```

**service.yaml**
```yaml
apiVersion: v1
kind: Service
metadata:
  name: time-app-service
spec:
  type: LoadBalancer
  selector:
    app: time-app
  ports:
    - port: 80
      targetPort: 8080
```

#### 🚀 Deploy to Cluster
```bash
kubectl apply -f deployment.yaml
kubectl apply -f service.yaml
```

#### 🌐 4. Access the App:
```bash
kubectl get svc
```
- Open the **EXTERNAL-IP** of `time-app-service` in browser.
- Output: `Current Date and Time: Thu, 11 Jul 2025 14:56:10 IST`

### 📁 Files:
```
Problem-3-GoLang-K8s-Deployment/
├── go-app/
│   └── main.go
├── Dockerfile
├── k8s-manifests/
│   ├── deployment.yaml
│   └── service.yaml
├── README.md

```

---

## 📸 Screenshots Added

- `Problem-1/wireframes/dashboard.png` ← Real scan result from Kubescape (ARMO UI)
- `Problem-2/kubescape-findings.json` ← Actual JSON scan output

---

## 🧪 Platforms Used

| Tool         | Purpose                            |
|--------------|------------------------------------|
| GoLang       | Build date/time app                |
| Docker       | Containerize app                   |
| DockerHub    | Host public image                  |
| AWS EKS      | Run Kubernetes cluster             |
| Kubescape    | Security scanning tool             |
| ARMO Cloud   | View scan results in beautiful UI  |
| EC2          | Control node to run `kubectl` etc. |

---

## 🏁 Conclusion

This project helped me apply product thinking and cloud-native implementation side-by-side:

- Designed a dashboard (UX + functionality)
- Ran real security tools in AWS cloud
- Built and deployed a microservice end-to-end
