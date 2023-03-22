# Simple creation of subnets using lists and count
module "vpc" {
  source = "./modules/vpc_simple"

  vpc_name       = "pre-commit-demo-vpc"
  vpc_cidr_block = "10.0.0.0/16"

  subnets_names         = ["subnet-1", "subnet-2", "subnet-4" ]
  subnets_azs           = ["eu-west-1a", "eu-west-1b", "eu-west-1a"]
  subnets_cidr_lists    = ["10.0.1.0/24", "10.0.2.0/24", "10.0.4.0/24"]
  subnets_map_public_ip = [true, false, false]
}
