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

### 
```
client-go 四种client， 
基类 restclient, 
clientset 只能获取内置资源，不能获取crd，discoveryclient
DynamicClient 可获取全部资源
discoveryclient 获取现有所有资源 版本

```

### client-go arch
```
1. Reflector 使用List-watch监控特定资源对象，获取增量信息存入DeltaFIFO。
2. DeltaFIFO 增量队列
3. LocalStore informer读取DeltaFIFO后创建本地缓存的地方
4. workqueue 缓存创建后（同步后）DeltaFIFO会pop事件到controller，调用ResourceEventHandler回调函数（OnAdd，OnUpdate，OnDelete），最后放入workqueue
5. work通过client操作k8s
```

### DiscoveryClient
```
CachedDiscoveryClient 缓存至~/.kube/cache
memCacheClient 缓存至~/.kube/http-cache
```