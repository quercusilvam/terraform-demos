variable "eks_cluster_id" {
  type     = string
  default  = "eks-aws-poc"
  nullable = false
}

variable "eks_cluster_oidc_issuer_url" {
  type     = string
  nullable = false
}

variable "eks_oidc_provider_arn" {
  type     = string
  nullable = false
}

variable "efs_suffix" {
  default = "test"
}

variable "network_config" {
  type = object({
    vpc_id             = string,
    subnet_id          = string,
    eks_workers_sg_ids = list(string)
  })
}

variable "eks_efs_driver_role_name" {
  default = "test-eks-efs-role"
}
