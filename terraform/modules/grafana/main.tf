# /terraform/modules/grafana/main.tf

# Retrieve Grafana Admin Password from Secrets Manager
data "aws_secretsmanager_secret_version" "grafana_password" {
  secret_id = "grafanaAdminPassword"
}

# Example Helm Release for Grafana
resource "helm_release" "grafana" {
  name       = "grafana"
  chart      = "grafana/grafana"
  namespace  = "monitoring"

  set {
    name  = "admin.password"
    value = data.aws_secretsmanager_secret_version.grafana_password.secret_string
  }
}
