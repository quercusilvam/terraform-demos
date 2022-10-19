Demo of EKS EFS CSI driver. Documentation:
- [Amazon EFS CSI driver](https://docs.aws.amazon.com/eks/latest/userguide/efs-csi.html)
- [GitHub of EFS CSI driver](https://github.com/kubernetes-sigs/aws-efs-csi-driver)
- [EFS access points](https://docs.aws.amazon.com/efs/latest/ug/efs-access-points.html)

Keep in mind, that kubernetes/helm code should be in different 'terraform apply' flow than creating EKS cluster itself. [More](https://registry.terraform.io/providers/hashicorp/kubernetes/latest/docs#stacking-with-managed-kubernetes-cluster-resources)