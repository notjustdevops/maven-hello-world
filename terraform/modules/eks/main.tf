provider "aws" {
  region = var.aws_region
}

# Create EKS Cluster
resource "aws_eks_cluster" "eks_cluster" {
  name     = var.eks_cluster_name
  version  = var.eks_cluster_version
  role_arn = var.eks_role_arn

  vpc_config {
    subnet_ids = var.public_subnets
  }

  depends_on = [var.iam_dependency]  # Ensure IAM is applied before EKS
}

# Create EKS Node Group (worker nodes)
resource "aws_eks_node_group" "eks_node_group" {
  cluster_name    = aws_eks_cluster.eks_cluster.name
  node_group_name = "${var.resource_prefix}-node-group"
  node_role_arn   = var.eks_worker_role_arn
  subnet_ids      = var.public_subnets
  instance_types  = [var.eks_instance_type]

  scaling_config {
    desired_size = var.eks_desired_capacity
    min_size     = var.eks_min_capacity
    max_size     = var.eks_max_capacity
  }

  tags = var.tags

  depends_on = [aws_eks_cluster.eks_cluster]
}

