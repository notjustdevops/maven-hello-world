# path: /maven-hello-world/terraform/modules/argocd/variables.tf

variable "argocd_namespace" {
  description = "The namespace to deploy ArgoCD"
  type        = string
  default     = "argocd"
}

variable "chart_version" {
  description = "Version of the ArgoCD Helm chart"
  type        = string
  default     = "5.19.5"  # Specify the version you wish to use
}

variable "ingress_domain" {
  description = "The domain for ingress to expose ArgoCD"
  type        = string
}

# path: /maven-hello-world/terraform/modules/argocd/variables.tf

variable "eks_cluster_endpoint" {
  description = "The endpoint for the EKS cluster"
  type        = string
}

variable "eks_cluster_ca" {
  description = "The certificate authority for the EKS cluster"
  type        = string
}

variable "eks_cluster_name" {
  description = "The name of the EKS cluster"
  type        = string
}
