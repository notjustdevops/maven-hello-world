variable "aws_region" {
  description = "AWS region"
  type        = string
}

variable "argocd_namespace" {
  description = "Namespace for ArgoCD"
  type        = string
}

variable "argocd_chart_version" {
  description = "Helm chart version for ArgoCD"
  type        = string
}

variable "tags" {
  description = "Tags to be applied to all resources"
  type        = map(string)
}

variable "subdomain_argocd" {
  description = "The subdomain for accessing ArgoCD"
  type        = string
}

variable "argocd_admin_password" {
  description = "The admin password for ArgoCD"
  type        = string
}
