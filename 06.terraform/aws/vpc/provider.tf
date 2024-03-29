terraform {
  required_providers {
    aws = {
      source  = "hashicorp/aws"
      version = ">= 4.27.0"
    }

    random = {
      source  = "hashicorp/random"
      version = ">= 3.1.0"
    }

    local = {
      source  = "hashicorp/local"
      version = ">= 2.2.0"
    }

    null = {
      source  = "hashicorp/null"
      version = ">= 3.1.0"
    }
  }

  required_version = ">= 0.14"
}

provider "aws" {
  region = var.default_region
}
