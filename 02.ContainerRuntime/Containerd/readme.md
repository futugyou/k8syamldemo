#### [containerd](https://kubernetes.io/docs/setup/production-environment/container-runtimes/#containerd）
#### use containerd for k8s
#### 1. run 00.check.sh
#### 2. run ../docker/00.install.sh
#### 3. run 01.config.sh
#### 4. use systemd cgroup ,edit /etc/containerd/config.toml
```
[plugins."io.containerd.grpc.v1.cri".containerd.runtimes.runc]
  ...
  [plugins."io.containerd.grpc.v1.cri".containerd.runtimes.runc.options]
    SystemdCgroup = true
```
#### 5. sudo systemctl restart containerd


#### use containerd
```
docker build -t k8s-mom:v1 . && docker save k8s-mon > demo.tar
ctr --namespace k8s.qo images inport demo.tar
ctr --namespace k8s.io images tag docker.io/library/k8s-mom:v1 k8s-mom:v1
ctr --namespace k8s.io images ls
```