#### Refer to [here](https://jimmysong.io/kubernetes-handbook/practice/install-kubernetes-on-centos.html) for the operation steps 

## 0~3 install docker and harbor (OS: wsl Ubuntu.20.04)
```shell
# use wsl ,you need exec those commands after you entry the system, then you can use systemctl
apt install daemonize
daemonize /usr/bin/unshare --fork --pid --mount-proc /lib/systemd/systemd --system-unit=basic.target
exec sudo nsenter -t $(pidof systemd) -a su - $LOGNAME
```
#### https://github.com/goharbor/harbor/releases

## 4~8 Create TLS certificate and key