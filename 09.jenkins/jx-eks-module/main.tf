module "eks-jx" {
  source              = "jenkins-x/eks-jx/aws"
  create_eks          = false
  create_vpc          = false
  cluster_name        = var.cluster_name
  create_nginx        = true
  nginx_chart_version = var.nginx_version
  jx_git_url          = var.jx_git_url
  jx_bot_username     = var.jx_bot_username
  jx_bot_token        = var.jx_bot_token
  force_destroy       = true
}


output "jx_requirements" {
  value = module.eks-jx.jx_requirements
}

output "vault_user_id" {
  value       = module.eks-jx.vault_user_id
  description = "The Vault IAM user id"
}

output "vault_user_secret" {
  value       = module.eks-jx.vault_user_secret
  description = "The Vault IAM user secret"
  sensitive   = true
}
