output "api_base_url" {
  value = "https://${aws_instance.example.private_dns}:8433/"

  # An output value with a precondition can check the object that the
  # output value is describing to make sure it meets expectations before
  # any caller of this module can use it.
  #  precondition {
  #    condition     = data.aws_ebs_volume.example.encrypted
  #    error_message = "The server's root volume is not encrypted."
  #  }
}
