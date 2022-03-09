# Deploy NodeJS Backend API
cd nodejs
kubectl apply -f deployment.yaml
kubectl apply -f service.yaml
kubectl get deployment eksdemo-nodejs

# Deploy Backend App
cd ../backend
kubectl apply -f deployment.yaml
kubectl apply -f service.yaml
kubectl get deployment eksdemo-crystal

# Deploy Frontend App
cd ../frontend
kubectl apply -f deployment.yaml
kubectl apply -f service.yaml
kubectl get deployment eksdemo-frontend

# Check Frontend App
kubectl get service eksdemo-frontend -o wide
ELB=$(kubectl get service ecsdemo-frontend -o json | jq -r '.status.loadBalancer.ingress[].hostname')
curl -m3 -v $ELB

# Scale Deployments
kubectl scale deployment eksdemo-nodejs --replicas=3
kubectl scale deployment eksdemo-crystal --replicas=3
kubectl scale deployment eksdemo-frontend --replicas=3
kubectl get deployments
