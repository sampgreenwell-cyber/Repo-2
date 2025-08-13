#!/bin/bash
# auto-update.sh - Automatically update Kubernetes when new image is available

echo "🔄 Checking for new Docker image..."

# Force pull the latest image
docker pull ghcr.io/sampgreenwell-cyber/todo-app:latest

# Update Kubernetes deployment
kubectl set image deployment/todo-app todo-app=ghcr.io/sampgreenwell-cyber/todo-app:latest

# Check rollout status
kubectl rollout status deployment/todo-app

echo "✅ Kubernetes deployment updated!"
echo "🌐 Access your app:"
minikube service todo-app-service --url