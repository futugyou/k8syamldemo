terraform {
  required_providers {
    aws = {
      source  = "hashicorp/aws"
      version = ">= 4.29.0"
    }
  }

  required_version = ">= 0.14"
}

provider "aws" {
  region = var.default_region
}
