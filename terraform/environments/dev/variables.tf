variable "aws_region" {
  description = "AWS region for the project"
  type        = string
}

variable "account_id" {
  description = "AWS account ID"
  type        = string
}

# VPC Configuration
variable "vpc_cidr_block" {
  description = "CIDR block for the VPC"
  type        = string
}

variable "public_subnets" {
  description = "List of public subnet CIDRs"
  type        = list(string)
}

variable "private_subnets" {
  description = "List of private subnet CIDRs"
  type        = list(string)
}

variable "availability_zones" {
  description = "List of availability zones"
  type        = list(string)
}

# Prefix for resource naming
variable "resource_prefix" {
  description = "Prefix for naming resources"
  type        = string
}

# Common tags applied to all resources
variable "tags" {
  description = "Tags applied to all resources"
  type        = map(string)
}

# EKS Configuration
variable "eks_cluster_name" {
  description = "The name of the EKS cluster"
  type        = string
}

variable "eks_cluster_version" {
  description = "The Kubernetes version for the EKS cluster"
  type        = string
}

variable "eks_instance_type" {
  description = "Instance type for the EKS worker nodes"
  type        = string
}

variable "eks_desired_capacity" {
  description = "Desired number of worker nodes"
  type        = number
}

variable "eks_min_capacity" {
  description = "Minimum number of worker nodes"
  type        = number
}

variable "eks_max_capacity" {
  description = "Maximum number of worker nodes"
  type        = number
}

# Route 53 Configuration
variable "domain_name" {
  description = "The domain name used for the project"
  type        = string
}

variable "s3_bucket_name" {
  description = "The name of the S3 bucket used for Terraform state"
  type        = string
}

variable "dynamodb_table_name" {
  description = "The name of the DynamoDB table used for Terraform state locking"
  type        = string
}

# IAM Configuration
variable "iam_role_name" {
  description = "The name of the IAM role for EKS"
  type        = string
}

# Ingress Configuration
variable "ingress_domain" {
  description = "The domain used for Ingress configuration"
  type        = string
}

# ArgoCD Configuration
variable "argocd_namespace" {
  description = "The namespace used for ArgoCD"
  type        = string
}

variable "argocd_chart_version" {
  description = "The version of the ArgoCD Helm chart"
  type        = string
}

# Grafana Configuration
variable "grafana_namespace" {
  description = "The namespace used for Grafana"
  type        = string
}

variable "grafana_chart_version" {
  description = "The version of the Grafana Helm chart"
  type        = string
}

variable "grafana_admin_password" {
  description = "The admin password for Grafana"
  type        = string
}

variable "argocd_admin_password" {
  description = "The admin password for ArgoCD"
  type        = string
}

variable "subdomain_grafana" {
  description = "The subdomain for Grafana"
  type        = string
}

variable "subdomain_argocd" {
  description = "The subdomain for ArgoCD"
  type        = string
}
