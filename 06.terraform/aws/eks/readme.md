###
```
aws eks --region $(terraform output -raw region) update-kubeconfig --name $(terraform output -raw cluster_name)
aws eks --region ap-southeast-1 update-kubeconfig --name eks-osim-dev
```