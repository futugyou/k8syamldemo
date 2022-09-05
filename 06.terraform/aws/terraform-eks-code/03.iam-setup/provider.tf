provider "aws" {
  region = var.region
}

terraform {
  required_providers {
    aws = {
      version = "~> 4.21.0"
    }
  }
  backend "s3" {
    bucket         = "tf-state-ip-172-31-3-99-1610534831592022427"
    key            = "terraform/terraform_locks_iam.tfstate"
    region         = var.region
    dynamodb_table = "terraform_locks_iam"
    encrypt        = "true"
  }
}
