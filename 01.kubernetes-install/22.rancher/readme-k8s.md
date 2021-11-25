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

### change website address 
```
http://locahost:8080/admin/settings
```

### ERROR: DNS Checking loopback IP address 127.0.0.0/8
```
sudo vi /etc/docker/daemon.json
add rancher website ip into 'dns' node, like this 
{
  "exec-opts": ["native.cgroupdriver=systemd"],
  "log-driver": "json-file",
  "log-opts": {
    "max-size": "100m"
  },
  "storage-driver": "overlay2",
  "registry-mirrors": [
    "https://docker.mirrors.ustc.edu.cn/"
  ],
  "dns": ["8.8.8.8", "8.8.4.4", "172.24.160.1"]
}
sudo service docker restart
```