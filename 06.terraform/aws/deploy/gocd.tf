resource "helm_release" "gocd" {
  repository       = var.gocd_charts_url
  name             = "gocd"
  chart            = "gocd"
  namespace        = var.gocd-namespace
  cleanup_on_fail  = true
  create_namespace = true
  
  set {
    name  = "server.security.ssh.enabled"
    value = true
  }

  set {
    name  = "agent.replicaCount"
    value = 1
  }

  set {
    name  = "agent.image.repository"
    value = "gocd/gocd-agent-docker-dind"
  }

  set {
    name  = "agent.security.ssh.enabled"
    value = true
  }

  set {
    name  = "agent.persistence.enabled"
    value = true
  }

  set {
    name  = "agent.persistence.extraVolumes[0].name"
    value = "kubectl"
  }

  set {
    name  = "agent.persistence.extraVolumes[0].emptyDir.medium"
    value = ""
  }
  
  set {
    name  = "agent.persistence.extraVolumeMounts[0].name"
    value = "kubectl"
  }
  
  set {
    name  = "agent.persistence.extraVolumeMounts[0].mountPath"
    value = "/usr/local/bin/kubectl"
  }

  set {
    name  = "agent.persistence.extraVolumeMounts[0].subPath"
    value = "kubectl"
  }
  
  set {
    name  = "agent.initContainers[0].name"
    value = "download-kubectl"
  }
  
  set {
    name  = "agent.initContainers[0].image"
    value = "ellerbrock/alpine-bash-curl-ssl:latest"
  }
  
  set {
    name  = "agent.initContainers[0].imagePullPolicy"
    value = "IfNotPresent"
  }
  
  set {
    name  = "agent.initContainers[0].volumeMounts[0].name"
    value = "kubectl"
  }
  
  set {
    name  = "agent.initContainers[0].volumeMounts[0].mountPath"
    value = "/download"
  }
  
  set {
    name  = "agent.initContainers[0].workingDir"
    value = "/download"
  }

  set {
    name  = "agent.initContainers[0].command[0]"
    value = "/bin/bash"
  }

  set {
    name  = "agent.initContainers[0].args[0]"
    value = "-c"
  }

  set {
    name  = "agent.initContainers[0].args[1]"
    value = "curl -LO https://storage.googleapis.com/kubernetes-release/release/$(curl -s https://storage.googleapis.com/kubernetes-release/release/stable.txt)/bin/linux/amd64/kubectl && chmod +x ./kubectl"
  }

}