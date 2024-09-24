# /home/notjust/Documents/devops/Projects/Rafael/maven-hello-world/terraform/environments/dev/provider.tf
provider "aws" {
  region = var.aws_region
}

terraform {
  required_providers {
    kubernetes = {
      source  = "hashicorp/kubernetes"
      version = ">= 2.0.0"
    }
  }
}

data "aws_eks_cluster_auth" "eks_auth" {
  name = module.eks.eks_cluster_name
}
