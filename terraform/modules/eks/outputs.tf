# /home/notjust/Documents/devops/Projects/Rafael/maven-hello-world/terraform/modules/eks/outputs.tf

# EKS Cluster Outputs
output "eks_cluster_name" {
  description = "The name of the EKS cluster"
  value       = aws_eks_cluster.eks_cluster.name
}

output "eks_cluster_endpoint" {
  description = "The API server endpoint for the EKS cluster"
  value       = aws_eks_cluster.eks_cluster.endpoint
}

output "eks_cluster_version" {
  description = "The Kubernetes version of the EKS cluster"
  value       = aws_eks_cluster.eks_cluster.version
}

# EKS Node Group Outputs
output "eks_node_group" {
  description = "Details of the EKS Node Group"
  value       = aws_eks_node_group.eks_node_group
}

output "eks_node_group_arn" {
  description = "The ARN of the EKS node group"
  value       = aws_eks_node_group.eks_node_group.arn
}

output "eks_worker_iam_role_arn" {
  description = "The IAM role ARN for the EKS worker nodes"
  value       = aws_iam_role.eks_worker_role.arn
}

output "eks_cluster_certificate_authority" {
  description = "The EKS cluster certificate authority data"
  value       = aws_eks_cluster.eks_cluster.certificate_authority[0].data
}

output "eks_cluster_ca" {
  value = aws_eks_cluster.eks_cluster.certificate_authority[0].data
}

