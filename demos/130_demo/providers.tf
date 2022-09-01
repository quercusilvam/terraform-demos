terraform {
  required_providers {
    aws = {
      source  = "hashicorp/aws"
      version = "4.28.0"
    }
  }
}

provider "aws" {
  region  = "eu-west-1"
  profile = "tfdemo"

  default_tags {
    tags = {
      project = "r130-demo"
    }
  }
}