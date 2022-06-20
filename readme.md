yaml for practice, and other things...


```
sudo daemonize /usr/bin/unshare --fork --pid --mount-proc /lib/systemd/systemd --system-unit=basic.target
exec sudo  nsenter -t $(pidof systemd) -a su - $LOGNAME
```

### The connection to the server localhost:8080 was refused - did you specify the right host or port
```
check /etc/kubernetes/admin.conf
if have not it , use .kube/config
then:
vi /etc/profile 
add 'export KUBECONFIG=/etc/kubernetes/admin.conf'
source /etc/profile 
```