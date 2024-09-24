resource "kubernetes_ingress" "cluster_ingress" {
  metadata {
    name      = "cluster-wide-ingress"
    namespace = var.argocd_namespace
    annotations = {
      "kubernetes.io/ingress.class" = "nginx"  # Adjust based on your ingress controller
    }
  }

  spec {
    rule {
      host = "argocd.${var.ingress_domain}"

      http {
        path {
          path     = "/"
          #path_type = "Prefix"
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
}
