variable "vpc_cidr_block" {}

variable "vpc_name" {}

variable "subnets" {
  type = list(object(
    {
      name      = string,
      cidr_list = string,
      az        = string
    }
    )
  )
}