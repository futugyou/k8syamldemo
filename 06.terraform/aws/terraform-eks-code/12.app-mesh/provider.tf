terraform {
  backend "s3" {
    bucket         = "terraform-eks-code"
    key            = "terraform/terraform_locks_mesh.tfstate"
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
  }

  required_version = ">= 0.14"
}

provider "aws" {
  region = var.default_region
}

provider "kubernetes" {
  config_path = "~/.kube/config"
}