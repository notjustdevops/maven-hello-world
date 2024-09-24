

# Automatically retrieve AWS account ID
data "aws_caller_identity" "current" {}

# Include the VPC module
module "vpc" {
  source             = "../../modules/vpc"
  aws_region         = var.aws_region
  vpc_cidr_block     = var.vpc_cidr_block
  public_subnets     = var.public_subnets
  private_subnets    = var.private_subnets
  availability_zones = var.availability_zones
  resource_prefix    = var.resource_prefix
  tags               = var.tags
}

# Include the IAM module for EKS role management
module "iam" {
  source              = "../../modules/iam"
  aws_region          = var.aws_region
  resource_prefix     = var.resource_prefix
  tags                = var.tags
  s3_bucket_name      = var.s3_bucket_name
  dynamodb_table_name = var.dynamodb_table_name
  account_id          = data.aws_caller_identity.current.account_id
  iam_role_name       = var.iam_role_name

  # Pass new variables related to EKS cluster and worker roles
  eks_cluster_name                    = var.eks_cluster_name
  eks_cluster_version                 = var.eks_cluster_version
  eks_cluster_endpoint_private_access = var.eks_cluster_endpoint_private_access
  create_worker_role                  = var.create_worker_role
}





# Automatically retrieve Grafana Admin Password from Secrets Manager
data "aws_secretsmanager_secret_version" "grafana_admin_password" {
  secret_id = "arn:aws:secretsmanager:us-west-2:864492617736:secret:grafanaAdminPassword"
}

# Grafana module for managing Grafana deployment
#module "grafana" {
#  source                = "../../modules/grafana"
#
#  # Ensure the grafana module has an input variable for admin password
#  grafana_admin_password = data.aws_secretsmanager_secret_version.grafana_admin_password.secret_string
#}
#

# EKS module
module "eks" {
  source = "../../modules/eks"

  aws_region           = var.aws_region
  eks_cluster_name     = var.eks_cluster_name
  eks_cluster_version  = var.eks_cluster_version
  eks_instance_type    = var.eks_instance_type
  eks_desired_capacity = var.eks_desired_capacity
  eks_min_capacity     = var.eks_min_capacity
  eks_max_capacity     = var.eks_max_capacity
  resource_prefix      = var.resource_prefix

  # Pass VPC output variables
  vpc_id          = module.vpc.vpc_id
  public_subnets  = module.vpc.public_subnets
  private_subnets = module.vpc.private_subnets

  # Pass IAM output variables
  eks_role_arn        = module.iam.eks_role_arn
  eks_worker_role_arn = module.iam.eks_worker_role_arn

  # Pass AWS Account ID
  account_id = data.aws_caller_identity.current.account_id
  iam_dependency = true
  tags = var.tags

}






provider "kubernetes" {
  host                   = module.eks.eks_cluster_endpoint
  #cluster_ca_certificate = module.eks.eks_cluster_ca
  cluster_ca_certificate = base64decode(module.eks.eks_cluster_ca)

  token                  = data.aws_eks_cluster_auth.eks_auth.token
}

# path: /maven-hello-world/terraform/modules/iam/main.tf

resource "aws_iam_role" "eks_worker_role" {
  name               = "${var.resource_prefix}-eks-worker-role"
  assume_role_policy = data.aws_iam_policy_document.eks_assume_role.json

  tags = merge(
    var.tags,
    {
      Name = "${var.resource_prefix}-eks-worker-role"
    }
  )
}


# IAM Policy document for EKS worker role
data "aws_iam_policy_document" "eks_assume_role" {
  statement {
    actions = ["sts:AssumeRole"]
    principals {
      type        = "Service"
      identifiers = ["ec2.amazonaws.com"]
    }
  }
}


# Ingress module for managing Ingress resources
module "ingress" {
  source            = "../../modules/ingress"
  aws_region        = var.aws_region      # Add the missing aws_region variable
  resource_prefix   = var.resource_prefix # Add the missing resource_prefix variable
  ingress_domain    = var.ingress_domain
  argocd_namespace  = var.argocd_namespace
  grafana_namespace = var.grafana_namespace
  tags              = var.tags # Add the tags variable

  # Pass EKS outputs to ingress module
  eks_cluster_endpoint = module.eks.eks_cluster_endpoint
  eks_cluster_ca       = module.eks.eks_cluster_certificate_authority

  eks_cluster_name                    = module.eks.eks_cluster_name
  eks_cluster_certificate_authority   = module.eks.eks_cluster_certificate_authority

}