aws_region         = "us-west-2"
resource_prefix = "dvorkinguy-kepler-app"
account_id         = "864492617736"

# VPC Configuration
vpc_cidr_block     = "10.0.0.0/16"
public_subnets     = ["10.0.101.0/24", "10.0.102.0/24"]
private_subnets    = ["10.0.1.0/24", "10.0.2.0/24"]
availability_zones = ["us-west-2a", "us-west-2b"]

# Common tags applied to all resources
tags = {
  Name        = "dvorkinguy-kepler-app"
  Owner       = "Dvorkin Guy"
  Environment = "Dev"
}

eks_cluster_name        = "dvorkinguy-kepler-app-eks-cluster"
eks_cluster_version     = "1.24"
eks_instance_type       = "t3.medium"
eks_desired_capacity    = 2
eks_min_capacity        = 1
eks_max_capacity        = 3




# Route 53 Configuration
domain_name             = "notjustdevops.com"
subdomain_grafana       = "grafana.kepler.notjustdevops.com"
subdomain_argocd        = "argocd.kepler.notjustdevops.com"

# S3 and DynamoDB for state management (existing resources)
s3_bucket_name          = "dvorkinguy-kepler-app-terraform-state"
dynamodb_table_name     = "dvorkinguy-kepler-app-terraform-locks"

# IAM Configuration
iam_role_name           = "dvorkinguy-kepler-app-eks-role"  # Use the value directly, no interpolation needed

# Ingress Configuration
ingress_domain          = "kepler.notjustdevops.com"

# ArgoCD Configuration
argocd_namespace        = "argocd"
argocd_chart_version    = "latest"
argocd_admin_password = ""  # Add your password or retrieve it securely from Secrets Manager


# Grafana Configuration
grafana_namespace       = "monitoring"
grafana_chart_version   = "latest"
grafana_admin_password  = ""  # Retrieve from AWS Secrets Manager or GitHub Secrets
