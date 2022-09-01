variable "aws_ami_id" {
  type = string

  # Input variable validation can check that the AMI ID is syntactically valid.
  validation {
    condition     = can(regex("^ami-", var.aws_ami_id))
    error_message = "The AMI ID must have the prefix \"ami-\"."
  }
}

variable "subnet" {}