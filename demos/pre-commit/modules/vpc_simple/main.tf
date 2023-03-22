resource "aws_vpc" "this" {
  cidr_block = var.vpc_cidr_block

  enable_dns_support   = true
  enable_dns_hostnames = true

  tags = {
    Name = var.vpc_name
  }
}

resource "aws_subnet" "subnets" {
  count = length(var.subnets_names)

  vpc_id = aws_vpc.this.id

  availability_zone       = var.subnets_azs[count.index]
  cidr_block              = var.subnets_cidr_lists[count.index]
  map_public_ip_on_launch = var.subnets_map_public_ip[count.index]

  tags = {
    Name = var.subnets_names[count.index]
  }
}
