### gocd
```
kubectl port-forward svc/gocd-server 8153:8153 -n gocd
http://localhost:8153/

 ssh-keygen -t rsa -b 4096 -C "futugyousuzu@aliyun.com" -f gocd-server-ssh -P ""
 ssh-keyscan github.com > gocd_known_hosts
 kubectl create secret generic gocd-server-ssh --from-file=id_rsa=gocd-server-ssh --from-file=id_rsa.pub=gocd-server-ssh.pub --from-file=known_hosts=gocd_known_hosts -n gocd
   
 ssh-keygen -t rsa -b 4096 -C "futugyousuzu@aliyun.com" -f gocd-agent-ssh -P ""
 ssh-keyscan github.com > gocd_known_hosts
 kubectl create secret generic gocd-agent-ssh --from-file=id_rsa=gocd-agent-ssh --from-file=id_rsa.pub=gocd-agent-ssh.pub --from-file=known_hosts=gocd_known_hosts -n gocd
```