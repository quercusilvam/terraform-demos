data "aws_ami" "example" {

  owners = ["amazon"]

  filter {
    name   = "image-id"
    values = [var.aws_ami_id]
  }

  lifecycle {
    # A data resource with a postcondition can ensure that the selected AMI
    # meets this module's expectations, by reacting to the dynamically-loaded
    # AMI attributes.
    postcondition {
      condition     = self.architecture == "x86_64"
      error_message = "The selected AMI must be for the \"x86_64\" architecture."
    }
  }
}

resource "aws_instance" "example" {
  instance_type = "t3.micro"
  ami           = var.aws_ami_id

  subnet_id = var.subnet

  lifecycle {
    # A resource with a precondition can ensure that the selected AMI
    # is set up correctly to work with the instance configuration.
    precondition {
      condition     = data.aws_ami.example.architecture == "x86_64"
      error_message = "The selected AMI must be for the \"x86_64\" architecture."
    }

    # A resource with a postcondition can react to server-decided values
    # during the apply step and halt work immediately if the result doesn't
    # meet expectations.
    postcondition {
      condition     = self.private_dns != ""
      error_message = "EC2 instance must be in a VPC that has not private DNS hostnames enabled."
    }
  }
}

data "aws_ebs_volume" "example" {
  # We can use data resources that refer to other resources in order to
  # load extra data that isn't directly exported by a resource.
  #
  # This example reads the details about the root storage volume for
  # the EC2 instance declared by aws_instance.example, using the exported ID.

  filter {
    name = "volume-id"
    values = [aws_instance.example.root_block_device[0].volume_id]
  }
}
