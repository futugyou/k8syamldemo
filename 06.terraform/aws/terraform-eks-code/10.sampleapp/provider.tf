terraform {
  backend "s3" {
    bucket         = "terraform-eks-code"
    key            = "terraform/terraform_locks_lb.tfstate"
    dynamodb_table = "terraform_locks"
    region         = "ap-southeast-1"
  }

  required_providers {
    aws = {
      source  = "hashicorp/aws"
      version = ">= 4.30.0"
    }

    null = {
      source  = "hashicorp/null"
      version = ">= 3.1.1"
    }

    helm = {
      source  = "hashicorp/helm"
      version = "~> 2.4.1"
    }
  }

  required_version = ">= 0.14"
}

provider "aws" {
  region = var.default_region
}

provider "helm" {
  kubernetes {
    host                   = data.aws_eks_cluster.eks_cluster.endpoint
    cluster_ca_certificate = base64decode(data.aws_eks_cluster.eks_cluster.certificate_authority.0.data)
    exec {
      api_version = "client.authentication.k8s.io/v1alpha1"
      args        = ["eks", "get-token", "--cluster-name", data.aws_eks_cluster.eks_cluster.name]
      command     = "aws"
    }
  }
}

provider "kubernetes" {
  config_path = "~/.kube/config"
}