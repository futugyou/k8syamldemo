###
```
Operator 的运行机制是作为自定义扩展资源注册到
Controller Manager，通过 List-Watch 的方式监听对应资源的变化，然后在周期内的
各个环节进行相应的协调。
```

### kubeoperator
```
https://go.kubebuilder.io/introduction.html

curl -L -o kubebuilder https://go.kubebuilder.io/dl/latest/$(go env GOOS)/$(go env GOARCH)
chmod +x kubebuilder && sudo mv kubebuilder /usr/local/bin/

mkdir demo
cd demo
go mod init github.com/futugyou/operator/welcome
kubebuilder init --domain demo.welcome.domain --repo github.com/futugyou/operator/welcome
kubebuilder create api --group webapp --kind Welcome --version v1

make install
kubectl create -f config/crd/patches/
kubectl create -f config/samples/webapp_v1_welcome.yaml
kubectl get crd
kubectl get welcome

make manifests
make run

make uninstall
make undeploy
```