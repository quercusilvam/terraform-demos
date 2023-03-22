resource "aws_vpc" "this" {
  cidr_block = var.vpc_cidr_block

  enable_dns_support   = false
  enable_dns_hostnames = false

  tags = {
    Name = var.vpc_name
  }
}

resource "aws_subnet" "private" {
  count = length(var.subnets)

  vpc_id = aws_vpc.this.id

  availability_zone       = var.subnets[count.index]["az"]
  cidr_block              = var.subnets[count.index]["cidr_list"]
  map_public_ip_on_launch = false

  tags = {
    Name = var.subnets[count.index]["name"]
  }
}
