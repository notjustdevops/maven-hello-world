# /maven-hello-world/terraform/modules/eks/variables.tf

variable "aws_region" {
  description = "AWS region for EKS"
  type        = string
}

variable "eks_cluster_name" {
  description = "Name of the EKS cluster"
  type        = string
}

variable "eks_cluster_version" {
  description = "Kubernetes version for the EKS cluster"
  type        = string
}

variable "eks_instance_type" {
  description = "Instance type for EKS worker nodes"
  type        = string
}

variable "eks_desired_capacity" {
  description = "Desired number of worker nodes in EKS"
  type        = number
}

variable "eks_min_capacity" {
  description = "Minimum number of worker nodes in EKS"
  type        = number
}

variable "eks_max_capacity" {
  description = "Maximum number of worker nodes in EKS"
  type        = number
}

variable "resource_prefix" {
  description = "Prefix for naming resources"
  type        = string
}

variable "vpc_id" {
  description = "VPC ID for EKS"
  type        = string
}

variable "public_subnets" {
  description = "List of public subnets for EKS"
  type        = list(string)
}

variable "private_subnets" {
  description = "List of private subnets for EKS"
  type        = list(string)
}

variable "eks_role_arn" {
  description = "ARN for the EKS cluster role"
  type        = string
}

variable "eks_worker_role_arn" {
  description = "ARN for the EKS worker role"
  type        = string
}

variable "tags" {
  description = "Tags for EKS resources"
  type        = map(string)
}



variable "iam_dependency" {
  description = "Dependency to ensure IAM module is applied first"
  type        = bool
}
