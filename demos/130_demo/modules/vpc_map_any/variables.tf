variable "vpc_cidr_block" {}

variable "vpc_name" {}

variable "subnets_parameters" {
  description = "Follow structure from default"
  type = map(any)
  default = {
    "example" = {
      name = "subnet",
      az = "eu-west-1a",
      cidr = "10.0.1.0/24",
      map_public_ip = true
    }
  }
}