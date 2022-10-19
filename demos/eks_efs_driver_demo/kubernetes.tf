provider "kubernetes" {
  host                   = data.aws_eks_cluster.cluster.endpoint
  cluster_ca_certificate = base64decode(data.aws_eks_cluster.cluster.certificate_authority.0.data)
  token                  = data.aws_eks_cluster_auth.cluster.token
}

resource "kubernetes_service_account" "efs_service_account" {
  metadata {
    name      = "efs-csi-controller-sa"
    namespace = "kube-system"

    annotations = {
      "eks.amazonaws.com/role-arn" = "${aws_iam_role.eks_efs_driver.arn}"
    }
  }
}

# Example - creating pvc for mongo db
resource "kubernetes_storage_class" "aws_efs_mongodb" {
  metadata {
    name = "aws-efs-sc-mongodb"
  }
  storage_provisioner = "efs.csi.aws.com"
  reclaim_policy      = "Retain"

  parameters = {
    provisioningMode = "efs-ap"
    fileSystemId     = aws_efs_file_system.efs_mongo.id
    directoryPerms   = "777"
    gidRangeStart    = "999"
    gidRangeEnd      = "10000"
  }
}

resource "kubernetes_persistent_volume_claim" "efs_mongodb_pvc" {
  metadata {
    name = "mongodb-pvc"
  }
  spec {
    storage_class_name = "aws-efs-sc-mongodb"
    access_modes       = ["ReadWriteOnce"]
    resources {
      requests = {
        storage = "1Mi"
      }
    }
  }
  depends_on = [helm_release.provisioner]
}