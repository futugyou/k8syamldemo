terraform {
  backend "s3" {
    bucket         = "terraform-eks-code"
    key            = "terraform/terraform_locks_eks.tfstate"
    dynamodb_table = "terraform_locks"
    region         = "ap-southeast-1"
  }

  required_providers {
    aws = {
      source  = "hashicorp/aws"
      version = ">= 4.31.0"
    }

    random = {
      source  = "hashicorp/random"
      version = ">= 3.4.0"
    }

    local = {
      source  = "hashicorp/local"
      version = ">= 2.2.0"
    }

    null = {
      source  = "hashicorp/null"
      version = ">= 3.1.0"
    }

    kubernetes = {
      source  = "hashicorp/kubernetes"
      version = ">= 2.13"
    }
  }

  required_version = ">= 0.14"
}

provider "aws" {
  region = var.default_region
}
