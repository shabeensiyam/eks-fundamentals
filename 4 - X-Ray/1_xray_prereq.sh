# Create required IAM role
eksctl create iamserviceaccount --name xray-daemon --namespace default --cluster ekscluster-eksctl --attach-policy-arn arn:aws:iam::aws:policy/AWSXRayDaemonWriteAccess --approve --override-existing-serviceaccounts
kubectl label serviceaccount xray-daemon app=xray-daemon


