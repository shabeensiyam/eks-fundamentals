# Creating a new cluster with OIDC provisioned
cat << EOF > ekscluster.yaml
---
apiVersion: eksctl.io/v1alpha5
kind: ClusterConfig

metadata:
  name: ekscluster-eksctl
  region: us-east-1
  version: "1.19"

iam:
  withOIDC: true
  serviceAccounts:
  - metadata:
      name: iam-test
      namespace: default
    attachPolicyARNs:
    - "arn:aws:iam::aws:policy/AmazonS3ReadOnlyAccess"

availabilityZones: ["us-east-1a","us-east-1b"]

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

# Existing cluster addition
eksctl utils associate-iam-oidc-provider --cluster eksworkshop-eksctl --approve

eksctl create iamserviceaccount \
    --name iam-test \
    --namespace default \
    --cluster ekscluster-eksctl \
    --attach-policy-arn arn:aws:iam::aws:policy/AmazonS3ReadOnlyAccess \
    --approve \
    --override-existing-serviceaccounts
