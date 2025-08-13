# auto-update.ps1 - PowerShell version for Windows
Write-Host "🔄 Checking for new Docker image..." -ForegroundColor Cyan

# Force pull the latest image
Write-Host "Pulling latest image..." -ForegroundColor Yellow
docker pull ghcr.io/sampgreenwell-cyber/todo-app:latest

# Update Kubernetes deployment
Write-Host "Updating Kubernetes deployment..." -ForegroundColor Yellow
kubectl set image deployment/todo-app todo-app=ghcr.io/sampgreenwell-cyber/todo-app:latest

# Check rollout status
Write-Host "Checking rollout status..." -ForegroundColor Yellow
kubectl rollout status deployment/todo-app

Write-Host "✅ Kubernetes deployment updated!" -ForegroundColor Green
Write-Host "🌐 Getting your app URL..." -ForegroundColor Cyan

# Get the service URL
minikube service todo-app-service --url