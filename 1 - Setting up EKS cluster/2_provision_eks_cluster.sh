# Create manifest for EKS Cluster
cat << EOF > ekscluster.yaml
---
apiVersion: eksctl.io/v1alpha5
kind: ClusterConfig

metadata:
  name: ekscluster-eksctl
  region: us-east-1
  version: "1.19"

availabilityZones: ["us-east-1a", "us-east-1b"]

managedNodeGroups:
- name: nodegroup-eksctl
  desiredCapacity: 3
  instanceType: t3.small
  ssh:
    enableSsm: true
 cloudWatch:
  clusterLogging:
    enableTypes: ["*"]
EOF

# Create cluster from the manifest file
eksctl create cluster -f ekscluster.yaml
