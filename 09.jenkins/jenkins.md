####  win10 docker-desktop wsl2
```
docker run -d -p 49001:8080 -p 49000:50000 -v /d/docker/jekins:/var/jenkins_home --name myjenkins jenkins/jenkins

// admin password
cat /var/jenkins_home/secrets/initialAdminPassword
02b5344c4e154406bff263f481af9f67

// jenkins site url
vi /var/jenkins_home/hudson.model.UpdateCenter.xml
https://mirrors.tuna.tsinghua.edu.cn/jenkins/updates/update-center.json

// intranet penetration
use NATPP

//insert jenkins plugins
CloudBees Credentials Plugin
GitHub API Plugin
SSH Credentials Plugin
Git client plugin
SCM API Plugin
Mailer Plugin
Plain Credentials Plugin
GIT plugin
GitHub Plugin
Docker
Kubernetes
Publish over SSH

// http://localhost:49001/config/  GitHub Server


// http://localhost:49001/configureClouds/ docker 
open docker 2376 oprt
if window, it can be config in 'docker desktop -> General' , check 'Expose daemon on tcp://localhost:2375 without TLS'
linux , vi /lib/systemd/system/docker.service (perhaps usr/lib/systemd/system/docker.service)
Add -H tcp://0.0.0.0:2376 -H unix:///var/run/docker.sock to ExecStart
systemctl daemon-reload
systemctl restart docker

if use TLS  see create_tls_certs.sh

Config ssh
```

### AWS EC2 
```
outlook email 
SMTP server: smtp.office365.com 
Default user e-mail suffix: @domain.com
User Name: notification@domain.com
Password: ###########
Use SSL: no
SMTP Port: 25 or 587
Charset UTF-8

sudo vi /etc/sysconfig/jenkins 
JENKINS_JAVA_OPTIONS="-Djava.awt.headless=true -Dmail.smtp.starttls.enable=true"
JENKINS_ARGS="-Dmail.smtp.starttls.enable=true"
```