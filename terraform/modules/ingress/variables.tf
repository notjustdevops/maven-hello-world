# path: /maven-hello-world/terraform/modules/ingress/variables.tf

variable "aws_region" {
  description = "AWS region"
  type        = string
}

variable "resource_prefix" {
  description = "Prefix for resource naming"
  type        = string
}

variable "ingress_domain" {
  description = "Domain for Ingress"
  type        = string
}

variable "tags" {
  description = "Tags to be applied to all resources"
  type        = map(string)
}

variable "argocd_namespace" {
  description = "Namespace for ArgoCD deployment"
  type        = string
  default     = "argocd"
}

variable "grafana_namespace" {
  description = "Namespace for Grafana deployment"
  type        = string
  default     = "monitoring"
}




variable "eks_cluster_endpoint" {
  description = "The endpoint of the EKS cluster"
  type        = string
}


variable "eks_cluster_name" {
  description = "The name of the EKS cluster"
  type        = string
}

variable "api_version" {
  description = "The API version of the ArgoCD deployment"
  type        = string
  default     = "v1"
} 


variable "eks_cluster_ca" {
  description = "The EKS cluster certificate authority data"
  type        = string
}

variable "eks_cluster_certificate_authority" {
  description = "The EKS cluster certificate authority data"
  type        = string
}
