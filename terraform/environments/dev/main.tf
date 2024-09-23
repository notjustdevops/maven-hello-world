provider "aws" {
  region = var.aws_region
}

# Automatically retrieve AWS account ID
data "aws_caller_identity" "current" {}

# Include the VPC module, which should already be applied
module "vpc" {
  source              = "../../modules/vpc"
  aws_region          = var.aws_region
  vpc_cidr_block      = var.vpc_cidr_block
  public_subnets      = var.public_subnets
  private_subnets     = var.private_subnets
  availability_zones  = var.availability_zones
  resource_prefix     = var.resource_prefix
  tags                = var.tags
}

# Include the IAM module for EKS role management
module "iam" {
  source              = "../../modules/iam"
  aws_region          = var.aws_region
  resource_prefix     = var.resource_prefix
  tags                = var.tags
  s3_bucket_name      = var.s3_bucket_name
  dynamodb_table_name = var.dynamodb_table_name
  account_id          = data.aws_caller_identity.current.account_id  # Dynamically pass account_id
  iam_role_name       = var.iam_role_name
}


# Ingress module for managing Ingress resources
module "ingress" {
  source          = "../../modules/ingress"
  aws_region      = var.aws_region
  resource_prefix = var.resource_prefix
  ingress_domain  = var.ingress_domain
  tags            = var.tags
}

# Automatically retrieve ArgoCD Admin Password from Secrets Manager
data "aws_secretsmanager_secret_version" "argocd_admin_password" {
  secret_id = "arn:aws:secretsmanager:us-west-2:864492617736:secret:argocdAdminPassword"
}

# ArgoCD module
module "argocd" {
  source               = "../../modules/argocd"
  aws_region           = var.aws_region
  argocd_namespace     = var.argocd_namespace
  argocd_chart_version = var.argocd_chart_version
  subdomain_argocd     = var.subdomain_argocd
  argocd_admin_password = data.aws_secretsmanager_secret_version.argocd_admin_password.secret_string
  tags                 = var.tags
}


# Automatically retrieve Grafana Admin Password from Secrets Manager
data "aws_secretsmanager_secret_version" "grafana_admin_password" {
  secret_id = "arn:aws:secretsmanager:us-west-2:864492617736:secret:grafanaAdminPassword"
}

# Grafana module for managing Grafana deployment
module "grafana" {
  source                = "../../modules/grafana"
  aws_region            = var.aws_region
  grafana_namespace     = var.grafana_namespace
  grafana_chart_version = var.grafana_chart_version
  grafana_admin_password = data.aws_secretsmanager_secret_version.grafana_admin_password.secret_string
  subdomain_grafana     = var.subdomain_grafana
  tags                  = var.tags
}



module "eks" {
  source              = "../../modules/eks"

  aws_region          = var.aws_region
  eks_cluster_name    = var.eks_cluster_name
  eks_cluster_version = var.eks_cluster_version
  eks_instance_type   = var.eks_instance_type
  eks_desired_capacity = var.eks_desired_capacity
  eks_min_capacity    = var.eks_min_capacity
  eks_max_capacity    = var.eks_max_capacity
  resource_prefix     = var.resource_prefix

  # Pass VPC output variables
  vpc_id              = module.vpc.vpc_id
  public_subnets      = module.vpc.public_subnets
  private_subnets     = module.vpc.private_subnets

  # Pass IAM output variables
  eks_role_arn        = module.iam.eks_role_arn
  eks_worker_role_arn = module.iam.eks_worker_role_arn

  # Ensure IAM is applied before EKS
  iam_dependency      = true

  tags = var.tags
}
