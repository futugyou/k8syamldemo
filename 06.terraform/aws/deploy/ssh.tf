data "sshclient_host" "github_hosts" {
  for_each                 = toset( var.known_hosts )
  hostname                 = each.key
  port                     = 22
  username                 = "keyscan"
  insecure_ignore_host_key = true
}

data "sshclient_keyscan" "github_keyscan" {
  for_each  = data.sshclient_host.github_hosts
  host_json = each.value.json
}

# output "gocd_known_hosts" {
#   value = {
#     for k, v in data.sshclient_keyscan.github_keyscan : k => v.authorized_key
#   }
# }

# output "gocd_known_hosts" {
#   value     =   templatefile(
#     "${path.module}/templates/known_hosts.tpl",
#     { 
#       keyscan = data.sshclient_keyscan.github_keyscan,
#     }
#   )
# }

resource "tls_private_key" "gocd-server-ssh" {
  algorithm = "RSA"
  rsa_bits  = 4096
}

resource "tls_private_key" "gocd-agent-ssh" {
  algorithm = "RSA"
  rsa_bits  = 4096
}

output "gocd-server-ssh-public_key" {
  value     = tls_private_key.gocd-server-ssh.public_key_openssh
  sensitive = false
}

output "gocd-agent-ssh-public_key" {
  value     = tls_private_key.gocd-agent-ssh.public_key_openssh
  sensitive = false
}