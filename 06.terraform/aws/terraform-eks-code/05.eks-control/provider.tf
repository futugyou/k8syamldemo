terraform {
  backend "s3" {
    bucket         = "terraform-eks-code"
    key            = "terraform/terraform_locks_cluster.tfstate"
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

    kubernetes = {
      source  = "hashicorp/kubernetes"
      version = ">= 2.13.1"
    }

    tls = {
      source  = "hashicorp/tls"
      version = ">= 4.0.2"
    }
  }

  required_version = ">= 0.14"
}

provider "aws" {
  region = var.default_region
}
