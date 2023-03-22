variable "vpc_cidr_block" {}

variable "vpc_name" {}

variable "subnets_names" {
  type = list(string)
}

variable "subnets_azs" {
  type = list(string)
}

variable "subnets_cidr_lists" {
  type = list(string)
}

variable "subnets_map_public_ip" {
  type = list(bool)
}

variable "required" {
  type = string
}
