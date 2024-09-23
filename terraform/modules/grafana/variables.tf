# /terraform/modules/grafana/variables.tf

variable "namespace" {
  type        = string
  description = "Namespace for Grafana deployment"
  default     = "monitoring"
}


variable "aws_region" {
  description = "AWS region"
  type        = string
}

variable "grafana_namespace" {
  description = "Namespace for Grafana"
  type        = string
}

variable "grafana_chart_version" {
  description = "Helm chart version for Grafana"
  type        = string
}

variable "grafana_admin_password" {
  description = "Grafana admin password"
  type        = string
}

variable "tags" {
  description = "Tags for Grafana resources"
  type        = map(string)
}

variable "subdomain_grafana" {
  description = "The subdomain for accessing Grafana"
  type        = string
}
