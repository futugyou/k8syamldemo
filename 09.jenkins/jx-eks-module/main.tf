module "eks-jx" {
  source              = "jenkins-x/eks-jx/aws"
  cluster_version     = var.cluster_version
  create_nginx        = true
  nginx_chart_version = var.nginx_version
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
