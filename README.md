# k8s-cluster

## create 

* kubectl apply -f <file-name>

## Delete 

* kubectl delete -f <file-name>

* 1. curl -O https://raw.githubusercontent.com/kubernetes-sigs/aws-load-balancer-controller/v2.11.0/docs/install/iam_policy.json

* 2. create policy

```
 aws iam create-policy \
    --policy-name AWSLoadBalancerControllerIAMPolicy \
    --policy-document file://iam_policy.json
```

* 3.Replace my-cluster with the name of your clusterName
```
  eksctl utils associate-iam-oidc-provider --region=us-east-1 --cluster=my-cluster --approve
```

* 4.Replace my-cluster with the name of your cluster, 111122223333 with your account ID, and then run the command.

```
eksctl create iamserviceaccount \
  --cluster=my-cluster \
  --namespace=kube-system \
  --name=aws-load-balancer-controller \
  --role-name AmazonEKSLoadBalancerControllerRole \
  --attach-policy-arn=arn:aws:iam::111122223333:policy/AWSLoadBalancerControllerIAMPolicy \
  --approve
  ```