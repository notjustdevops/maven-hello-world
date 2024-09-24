# /home/notjust/Documents/devops/Projects/Rafael/maven-hello-world/terraform/modules/iam/variables.tf

variable "aws_region" {
  description = "AWS region"
  type        = string
}

variable "resource_prefix" {
  description = "Prefix for naming resources"
  type        = string
}

variable "tags" {
  description = "Tags to be applied to resources"
  type        = map(string)
}

variable "s3_bucket_name" {
  description = "Name of the S3 bucket used for Terraform state"
  type        = string
}

variable "dynamodb_table_name" {
  description = "Name of the DynamoDB table used for Terraform state locking"
  type        = string
}

variable "account_id" {
  description = "AWS account ID to be used in resource ARNs"
  type        = string
}

variable "iam_role_name" {
  description = "The IAM role name for EKS"
  type        = string
}


variable "eks_cluster_name" {
  description = "The name of the EKS cluster"
  type        = string
}
variable "eks_cluster_version" {
  description = "The version of the EKS cluster"
  type        = string
}

variable "eks_cluster_endpoint_private_access" {
  description = "Indicates whether or not the EKS private API server endpoint is enabled"
  type        = bool
}

variable "create_worker_role" {
  description = "Boolean flag to determine if a worker IAM role should be created"
  type        = bool
}


