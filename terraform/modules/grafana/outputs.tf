# /terraform/modules/grafana/outputs.tf

output "grafana_url" {
  value       = "https://${var.subdomain_grafana}"
  description = "Grafana URL"
}
