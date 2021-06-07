##### install rancher in k8s
##### https://rancher.com/docs/rancher/v2.x/en/installation/install-rancher-on-k8s/
##### Add the Helm Chart Repository
```
helm repo add rancher-latest https://releases.rancher.com/server-charts/latest
kubectl create namespace cattle-system
```

##### Install cert-managerl
```
kubectl apply --validate=false -f https://github.com/jetstack/cert-manager/releases/download/v1.0.4/cert-manager.crds.yaml
kubectl create namespace cert-manager
helm repo add jetstack https://charts.jetstack.io
helm repo update
helm install \
  cert-manager jetstack/cert-manager \
  --namespace cert-manager \
  --version v1.0.4
```

##### Install Rancher with Helm
```
helm install rancher rancher-latest/rancher \
  --namespace cattle-system \
  --set hostname=master01

kubectl -n cattle-system rollout status deploy/rancher
```