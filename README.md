# Docker Build & Deploy GitHub Action

This GitHub Action builds a Docker image from your repository and pushes it to **AWS ECR**.  
It demonstrates **real CI/CD automation**, perfect for DevOps portfolio.

---

## 🚀 Features

- Build Docker images from your repo
- Push images to AWS ECR
- Reusable action across multiple projects
- Simple integration with GitHub Actions workflow

---

## 📦 Usage


---

## ⚙️ Inputs

| Input | Description | Required |
|-------|------------|---------|
| aws-region | AWS region for ECR | ✅ |
| ecr-repo | Name of the ECR repository | ✅ |
| image-tag | Docker image tag | ✅ |

---

## 🔧 Usage

Create a workflow `.github/workflows/deploy.yml`:

```yaml
name: CI/CD Pipeline Demo

on:
  push:
    branches: [ "main" ]

jobs:
  deploy:
    runs-on: ubuntu-latest
    steps:
      - uses: actions/checkout@v3
      - name: Build & Push Docker Image
        uses: hemantbhosale916/github-actions-custom-actions/docker-build-deploy@main
        with:
          aws-region: us-east-1
          ecr-repo: my-app
          image-tag: latest


