# path: /maven-hello-world/terraform/modules/grafana/main.tf

provider "helm" {
  kubernetes {
    host                   = module.eks.eks_cluster_endpoint
    cluster_ca_certificate = base64decode(module.eks.eks_cluster_certificate_authority)
    token                  = data.aws_eks_cluster_auth.eks_auth.token
  }
}

resource "kubernetes_namespace" "grafana" {
  metadata {
    name = var.grafana_namespace
  }
}

resource "helm_release" "grafana" {
  name       = "grafana"
  chart      = "grafana"
  namespace  = kubernetes_namespace.grafana.metadata[0].name
  repository = "https://grafana.github.io/helm-charts"

  values = [
    file("${path.module}/values.yaml")
  ]

  set {
    name  = "adminPassword"
    value = data.aws_secretsmanager_secret_version.grafana_admin_password.secret_string
  }

  depends_on = [module.eks, module.ingress]  # Ensure Ingress is ready before Grafana deployment
}
