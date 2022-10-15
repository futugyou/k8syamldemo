terraform {
  backend "s3" {
    bucket         = "terraform-eks-code"
    key            = "terraform/terraform_locks_keycloak.tfstate"
    dynamodb_table = "terraform_locks"
    region         = "ap-southeast-1"
  }

  required_providers {
    keycloak = {
      source  = "mrparkers/keycloak"
      version = "4.0.1"
    }
  }
}

provider "keycloak" {
  client_id     = "terraform"
  client_secret = "MQvAeDO4fU7xCBU0Z4TAymFyphRMZrke"
  url           = "http://192.168.0.6:8080"
}
