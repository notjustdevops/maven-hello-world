#/home/notjust/Documents/devops/Projects/Rafael/maven-hello-world/terraform/environments/dev/outputs.tf

# VPC Outputs
output "vpc_id" {
  description = "ID of the VPC"
  value       = module.vpc.vpc_id
}

output "vpc_cidr_block" {
  description = "The CIDR block of the VPC"
  value       = module.vpc.vpc_cidr_block
}

output "public_subnets" {
  description = "IDs of the public subnets"
  value       = module.vpc.public_subnets
}

output "private_subnets" {
  description = "IDs of the private subnets"
  value       = module.vpc.private_subnets
}

output "nat_gateway_id" {
  description = "ID of the NAT gateway"
  value       = module.vpc.nat_gateway_id
}

# EKS Outputs
output "eks_role_arn" {
  description = "ARN of the EKS IAM Role"
  value       = module.iam.eks_role_arn
}

output "eks_worker_role_arn" {
  description = "ARN of the EKS worker node IAM Role"
  value       = module.iam.eks_worker_role_arn
}



output "eks_cluster_version" {
  value       = module.eks.eks_cluster_version
  description = "Kubernetes version of the EKS cluster"
}

output "eks_cluster_endpoint" {
  value       = module.eks.eks_cluster_endpoint
  description = "API endpoint of the EKS cluster"
}

output "eks_node_group" {
  value       = module.eks.eks_node_group
  description = "Details of the EKS Node Group"
}

# Additional Outputs for Ingress and ArgoCD
output "ingress_domain" {
  description = "Ingress domain used for services"
  value       = var.ingress_domain
}

output "argocd_namespace" {
  description = "Namespace where ArgoCD is deployed"
  value       = var.argocd_namespace
}

output "grafana_namespace" {
  description = "Namespace where Grafana is deployed"
  value       = var.grafana_namespace
}





output "eks_cluster_name" {
  description = "The name of the EKS cluster"
  value       = module.eks.eks_cluster_name  # Adjusting to the module output
}

output "eks_cluster_certificate_authority" {
  description = "The EKS cluster certificate authority data"
  value       = module.eks.eks_cluster_certificate_authority  # Adjusting to the module output
}
