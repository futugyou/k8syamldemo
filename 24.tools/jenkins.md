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

// http://localhost:49001/config/  GitHub Server


// http://localhost:49001/configureClouds/ docker 
Expose daemon on tcp://localhost:2375 without TLS in docker desktop -> General
```