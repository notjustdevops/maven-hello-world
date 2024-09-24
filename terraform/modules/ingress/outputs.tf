# path: /maven-hello-world/terraform/modules/ingress/outputs.tf

output "argocd_ingress_url" {
  description = "The Ingress URL for accessing ArgoCD"
  value       = "https://argocd.${var.ingress_domain}"
}

output "grafana_ingress_url" {
  description = "The Ingress URL for accessing Grafana"
  value       = "https://grafana.${var.ingress_domain}"
}



output "eks_cluster_certificate_authority" {
  value = var.eks_cluster_certificate_authority
}

output "eks_cluster_ca" {
  value = var.eks_cluster_certificate_authority  # Adjust this if needed
}

output "ingress_status" {
  description = "Status of the Ingress resource"
  value = {
    name      = kubernetes_ingress.cluster_ingress.metadata[0].name
    namespace = kubernetes_ingress.cluster_ingress.metadata[0].namespace
  }
}

