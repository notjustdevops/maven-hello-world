# /maven-hello-world/terraform/environments/dev/outputs.tf

output "vpc_id" {
  description = "ID of the VPC"
  value       = module.vpc.vpc_id
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

output "eks_role_arn" {
  description = "ARN of the EKS IAM Role"
  value       = module.iam.eks_role_arn
}

# Outputs for the EKS module
output "eks_cluster_name" {
  value       = module.eks.eks_cluster_name
  description = "EKS Cluster name"
}

output "eks_cluster_version" {
  value       = module.eks.eks_cluster_version
  description = "Kubernetes version of the EKS cluster"
}

output "eks_node_group" {
  value       = module.eks.eks_node_group
  description = "Details of the EKS Node Group"
}
