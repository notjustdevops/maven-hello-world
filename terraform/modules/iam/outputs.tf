# /home/notjust/Documents/devops/Projects/Rafael/maven-hello-world/terraform/modules/iam/outputs.tf

# EKS IAM Role ARN
output "eks_role_arn" {
  description = "ARN of the EKS IAM Role"
  value       = aws_iam_role.eks_role.arn
}

# EKS Worker IAM Role ARN (if different from eks_role)
output "eks_worker_role_arn" {
  description = "The ARN of the IAM role for EKS worker nodes"
  value       = aws_iam_role.eks_role.arn  # Adjust if you have a different role for worker nodes
}

# ArgoCD IAM Role ARN
output "argocd_role_arn" {
  description = "The ARN of the ArgoCD IAM Role"
  value       = aws_iam_role.argocd_role.arn
}

# Terraform Backend IAM Role ARN
output "terraform_backend_role_arn" {
  description = "The ARN of the Terraform backend IAM Role"
  value       = aws_iam_role.terraform_backend_role.arn
}

# Grafana IAM Role ARN
output "grafana_role_arn" {
  description = "The ARN of the Grafana IAM Role"
  value       = aws_iam_role.grafana_role.arn
}

output "terraform_s3_policy_arn" {
  description = "ARN of the IAM Role for Terraform S3 access"
  value       = aws_iam_role.terraform_backend_role.arn  # Referencing the role, not the policy
}

output "terraform_dynamodb_policy_arn" {
  description = "ARN of the IAM Role for DynamoDB access"
  value       = aws_iam_role.terraform_backend_role.arn  # Referencing the role, not the policy
}

output "grafana_cloudwatch_policy_arn" {
  description = "ARN of the IAM Role for Grafana CloudWatch access"
  value       = aws_iam_role.grafana_role.arn  # Referencing the role, not the policy
}

