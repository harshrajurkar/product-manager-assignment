#!/bin/bash

# Create the root folder
mkdir -p product-manager-assignment

# Problem 1: Product Requirements
mkdir -p product-manager-assignment/Problem-1-Product-Requirements/wireframes
touch product-manager-assignment/Problem-1-Product-Requirements/PRD.md
touch product-manager-assignment/Problem-1-Product-Requirements/wireframes/dashboard-wireframe.png

# Problem 2: Kubernetes Scan
mkdir -p product-manager-assignment/Problem-2-Kubernetes-Scan
touch product-manager-assignment/Problem-2-Kubernetes-Scan/kubescape-findings.json

# Problem 3: GoLang K8s Deployment
mkdir -p product-manager-assignment/Problem-3-GoLang-K8s-Deployment/go-app
mkdir -p product-manager-assignment/Problem-3-GoLang-K8s-Deployment/k8s-manifests
touch product-manager-assignment/Problem-3-GoLang-K8s-Deployment/go-app/main.go
touch product-manager-assignment/Problem-3-GoLang-K8s-Deployment/Dockerfile
touch product-manager-assignment/Problem-3-GoLang-K8s-Deployment/k8s-manifests/deployment.yaml
touch product-manager-assignment/Problem-3-GoLang-K8s-Deployment/k8s-manifests/service.yaml
touch product-manager-assignment/Problem-3-GoLang-K8s-Deployment/README.md

echo "All directories and files created successfully under 'product-manager-assignment/'"
