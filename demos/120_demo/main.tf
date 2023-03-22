terraform {
  required_providers {
    aws = {
      source  = "hashicorp/aws"
      version = "4.11.0"
    }
  }
}

provider "aws" {
  region = "eu-south-1"

  default_tags {
    tags = {
      project = "r120-demo"
    }
  }
}

module "vpc" {
  source = "./modules/vpc"

  vpc_cidr_block = "10.0.0.0/16"
  vpc_name       = "r120-demo-vpc"


  subnets = [
    {
      name      = "subnet-1",
      cidr_list = "10.0.1.0/24",
      az        = "eu-south-1a",
    }
  ]
}

module "ec2" {
  source = "./modules/ec2"
  subnet = module.vpc.subnet_id

  aws_ami_id = "something"
  #  aws_ami_id = "ami-02135847f064bbec4"
  #  aws_ami_id = "ami-0a3e7d18000ce46bf"

}
