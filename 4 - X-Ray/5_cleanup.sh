kubectl delete deployments x-ray-sample-front-k8s x-ray-sample-back-k8s

kubectl delete services x-ray-sample-front-k8s x-ray-sample-back-k8s

kubectl delete -f 2_xray-k8s-daemonset.yaml

eksctl delete iamserviceaccount --name xray-daemon --cluster eksworkshop-eksctl
