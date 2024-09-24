# path: /maven-hello-world/terraform/modules/ingress/main.tf


provider "kubernetes" {
  host                   = var.eks_cluster_endpoint
  cluster_ca_certificate = base64decode(var.eks_cluster_ca)
  token                  = data.aws_eks_cluster_auth.eks_auth.token
}


data "aws_eks_cluster_auth" "eks_auth" {
  name = var.eks_cluster_name
}

resource "kubernetes_ingress" "cluster_ingress" {
  metadata {
    name      = "cluster-wide-ingress"
    namespace = var.argocd_namespace
  }

  spec {
    rule {
      host = "argocd.${var.ingress_domain}"

      http {
        path {
          path     = "/"
          #path_type = "Prefix"  # Supported in newer Kubernetes versions
          backend {
            service_name = "argocd-server"
            service_port = 80
          }
        }
      }
    }

    rule {
      host = "grafana.${var.ingress_domain}"

      http {
        path {
          path     = "/"
          #path_type = "Prefix"
          backend {
            service_name = "grafana-server"
            service_port = 3000
          }
        }
      }
    }

    tls {
      secret_name = "cluster-tls"
      hosts       = ["argocd.${var.ingress_domain}", "grafana.${var.ingress_domain}"]
    }
  }

  depends_on = [module.eks]
}

