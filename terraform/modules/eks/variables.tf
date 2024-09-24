# /home/notjust/Documents/devops/Projects/Rafael/maven-hello-world/terraform/modules/eks/variables.tf
# AWS Region where EKS is deployed
variable "aws_region" {
  description = "AWS region for EKS"
  type        = string
}

# EKS Cluster Configuration
variable "eks_cluster_name" {
  description = "Name of the EKS cluster"
  type        = string
}

variable "eks_cluster_version" {
  description = "Kubernetes version for the EKS cluster"
  type        = string
}

# Instance Type for Worker Nodes
variable "eks_instance_type" {
  description = "Instance type for EKS worker nodes"
  type        = string
}

# Scaling configuration for EKS worker nodes
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

# Resource naming prefix for easier identification
variable "resource_prefix" {
  description = "Prefix for naming resources"
  type        = string
}

# VPC Configuration
variable "vpc_id" {
  description = "VPC ID where EKS is deployed"
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

# IAM Role ARNs
variable "eks_role_arn" {
  description = "ARN of the IAM role for the EKS control plane"
  type        = string
}

variable "eks_worker_role_arn" {
  description = "ARN of the IAM role for the EKS worker nodes"
  type        = string
}

# Common tags for all EKS-related resources
variable "tags" {
  description = "Tags for EKS resources"
  type        = map(string)
}

# Optional dependency to ensure IAM module is applied before EKS
variable "iam_dependency" {
  description = "Dependency to ensure IAM module is applied first"
  type        = bool
  default     = true
}

variable "account_id" {
  description = "AWS account ID"
  type        = string
}