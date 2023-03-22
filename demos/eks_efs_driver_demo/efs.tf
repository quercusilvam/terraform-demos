resource "aws_efs_file_system" "efs_mongo" {
  creation_token = "efs-mongo-${var.efs_suffix}"
  encrypted      = true

  tags = {
    Name = "efs-mongo-${var.efs_suffix}"
  }
}

resource "aws_efs_mount_target" "efs_mongo_mount_target" {
  for_each = var.network_config

  file_system_id  = aws_efs_file_system.efs_mongo.id
  subnet_id       = each.value.subnet_id
  security_groups = [aws_security_group.efs_security_group.id]
}

resource "aws_security_group" "efs_security_group" {
  for_each = var.network_config

  name        = "efs-sg-${var.efs_suffix}"
  description = "Allow access to EFS mount point"
  vpc_id      = each.value.vpc_id

  ingress {
    description = "TLS from VPC"
    from_port   = 2049
    to_port     = 2049
    protocol    = "tcp"

    security_groups = each.value.eks_workers_sg_ids
  }

  egress {
    from_port   = 0
    to_port     = 0
    protocol    = "-1"
    cidr_blocks = ["0.0.0.0/0"]
  }

  tags = {
    Name = "efs-sg-${var.efs_suffix}"
  }
}
