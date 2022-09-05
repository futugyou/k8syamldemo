provider "aws" {
  region = var.region

  s3_use_path_style           = true
  skip_credentials_validation = true
  skip_metadata_api_check     = true
  skip_requesting_account_id  = true

  endpoints {
    iam = "http://localhost:4566"
  }
}

terraform {
  required_providers {
    aws = {
      version = "~> 4.21.0"
    }
  }
}
