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

### List-Watch tools\cache\reflector.go ListAndWatch
```
watch使用了HTTP…分块传输编码Chunked Transfer Encoding
server返回Chunked，客户端收到Chunked后保持链接，等待下一个数据块
HTTP/1.1 200 OK
Content-Type: application/json
Transfer-Encoding: chunked

1. List 获取资源数据，同步到DeltaFIFO队列
2. 定时同步 定时触发Resync，将Indexer中的资源对象同步到DeltaFIFO队列
3. Watch 监听资源变化 调用相应事件处理函数
```

### Informer
```
Informer 执行list-watch操作（包括CRD），核心模块Reflector、DeltaFIFO、Indexer
```

### Reflctor tools\cache\reflector.go
```
List流程  List
1. r.listerWatcher.List(opts) 获取资源下所有对象数据
2. GetResourceVersion 
3. ExtractList 将runtime.Object => []runtime.Object
4. syncWith 将资源对象和版本号存入DeltaFIFO
5. setLastSyncResourceVersion

Watch流程 tools\cache\reflector.go
1. r.listerWatcher.Watch(options) tools\cache\listwatch.go watchfunc 长链接
2. watchHandler 更新watch.Added/Modified/Deleted/Bookmark 事件的资源， 存入DeltaFIFO
3. setLastSyncResourceVersion
```

### DeltaFIFO tools\cache\delta_fifo.go
```
1. 仅处理对象一次
2. 处理完当前版本才能处理后续
3. 删除对象不处理
4. 不能周期性重新处理对象
```