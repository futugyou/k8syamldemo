### https://k3s.io/
```
curl -sfL https://get.k3s.io | sh - 
sudo cp /etc/rancher/k3s/k3s.yaml ~/.kube/config
sudo chown $(id -u):$(id -g) $HOME/.kube/config
```