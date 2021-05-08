###### use virtualbox instead of hyper-v. virtualbox is more lightly.
```
https://www.virtualbox.org/wiki/Downloads
```

###### install minikube.
```
choco install minikube
```

###### run minikube.
```
minikube start --registry-mirror=https://registry.docker-cn.com --vm-driver="virtualbox" --image-repository=registry.cn-hangzhou.aliyuncs.com/google_containers
```
