# path: /maven-hello-world/terraform/modules/argocd/main.tf


provider "helm" {
  kubernetes {
    host                   = var.eks_cluster_endpoint
    cluster_ca_certificate = base64decode(var.eks_cluster_ca)
    token                  = data.aws_eks_cluster_auth.eks_auth.token
  }
}

data "aws_eks_cluster_auth" "eks_auth" {
  name = var.eks_cluster_name
}


# Retrieve the ArgoCD admin password from AWS Secrets Manager
data "aws_secretsmanager_secret_version" "argocd_admin_password" {
  secret_id = "arn:aws:secretsmanager:us-west-2:864492617736:secret:argocdAdminPassword"
}

resource "kubernetes_namespace" "argocd" {
  metadata {
    name = var.argocd_namespace
  }
}

# Remove the provider block if it's inside this module
resource "kubernetes_service" "argocd_server" {
  metadata {
    name      = "argocd-server"
    namespace = kubernetes_namespace.argocd.metadata[0].name
  }

  spec {
    type = "LoadBalancer"
    port {
      port     = 80
      protocol = "TCP"
      target_port = 8080  # Adjust based on your setup
    }
    selector = {
      app = "argocd-server"
    }
  }
}
