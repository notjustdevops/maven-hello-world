# /terraform/modules/argocd/main.tf

# Retrieve ArgoCD Admin Password from Secrets Manager
data "aws_secretsmanager_secret_version" "argocd_password" {
  secret_id = "argocdAdminPassword"
}

# Use the secret in your configuration
resource "helm_release" "argocd" {
  name      = "argocd"
  chart     = "argo/argo-cd"
  namespace = "argocd"

  set {
    name  = "configs.secret.argocdServerAdminPassword"
    value = data.aws_secretsmanager_secret_version.argocd_password.secret_string
  }
}
