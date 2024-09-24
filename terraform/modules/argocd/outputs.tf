# path: /maven-hello-world/terraform/modules/argocd/outputs.tf

output "argocd_server_url" {
  description = "The URL of the ArgoCD server"
  value       = "https://argocd.${var.ingress_domain}"
}

output "argocd_namespace" {
  description = "Namespace where ArgoCD is deployed"
  value       = kubernetes_namespace.argocd.metadata[0].name
}




# Output the ArgoCD admin password retrieved from AWS Secrets Manager
output "argocd_admin_password" {
  description = "The ArgoCD admin password retrieved from AWS Secrets Manager"
  value       = data.aws_secretsmanager_secret_version.argocd_admin_password.secret_string
}

# path: /maven-hello-world/terraform/modules/argocd/outputs.tf

output "argocd_service" {
  description = "Details of the ArgoCD service"
  value = {
    type        = kubernetes_service.argocd_server.spec[0].type
    external_ip = kubernetes_service.argocd_server.status[0].load_balancer[0].ingress[0].ip
    port        = kubernetes_service.argocd_server.spec[0].port[0].port  # Change ports to port
  }
}
