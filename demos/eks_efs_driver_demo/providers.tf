terraform {
  required_providers {
    aws = {
      source  = "hashicorp/aws"
      version = "4.28.0"
    }
    kubernetes = {
      source  = "hashicorp/kubernetes"
      version = "2.14.0"
    }
    helm = {
      source  = "hashicorp/helm"
      version = "2.7.1"
    }
  }
}

provider "aws" {
  region  = "eu-west-1"
  profile = "tfdemo"

  default_tags {
    tags = {
      project = "efs-driver-demo"
    }
  }
}
