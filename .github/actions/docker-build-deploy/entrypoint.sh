#!/bin/bash
set -e

echo "🚀 Starting Docker Build & Deploy GitHub Action"

# Inputs from action.yml
AWS_REGION=${INPUT_AWS_REGION}
ECR_REPO=${INPUT_ECR_REPO}
IMAGE_TAG=${INPUT_IMAGE_TAG}

# Configure AWS CLI
aws configure set region $AWS_REGION

# Login to ECR
echo "🔑 Logging in to AWS ECR"
aws ecr get-login-password --region $AWS_REGION | docker login --username AWS --password-stdin <AWS_ACCOUNT_ID>.dkr.ecr.$AWS_REGION.amazonaws.com

# Build Docker image
echo "📦 Building Docker image $ECR_REPO:$IMAGE_TAG"
docker build -t $ECR_REPO:$IMAGE_TAG .

# Tag & push
echo "📤 Pushing Docker image to ECR"
docker tag $ECR_REPO:$IMAGE_TAG <AWS_ACCOUNT_ID>.dkr.ecr.$AWS_REGION.amazonaws.com/$ECR_REPO:$IMAGE_TAG
docker push <AWS_ACCOUNT_ID>.dkr.ecr.$AWS_REGION.amazonaws.com/$ECR_REPO:$IMAGE_TAG

echo "✅ Docker image $ECR_REPO:$IMAGE_TAG pushed successfully!"
