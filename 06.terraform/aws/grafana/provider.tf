provider "aws" {
  region = var.default_region
}

terraform {
  backend "s3" {
    bucket         = "terraform-eks-code"
    key            = "terraform/terraform_locks_grafana.tfstate"
    dynamodb_table = "terraform_locks"
    region         = "ap-southeast-1"
  }

  required_providers {
    aws = {
      source  = "hashicorp/aws"
      version = ">= 4.31.0"
    }
  }
}
