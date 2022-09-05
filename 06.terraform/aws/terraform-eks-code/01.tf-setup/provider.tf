terraform {
  required_providers {
    aws = {
      source  = "hashicorp/aws"
      version = ">= 4.27.0"
    }
  }

  required_version = ">= 0.14"
}

provider "aws" {
  region = var.default_region

  s3_use_path_style         = true
  skip_credentials_validation = true
  skip_metadata_api_check     = true
  skip_requesting_account_id  = true

  endpoints { 
    dynamodb       = "http://localhost:4566"    
    s3             = "http://localhost:4566"    
  }
}
