# /terraform/modules/iam/outputs.tf

output "eks_role_arn" {
  description = "ARN of the EKS IAM Role"
  value       = aws_iam_role.eks_role.arn
}

# Add more outputs if needed for additional roles or policies
output "eks_worker_role_arn" {
  description = "The ARN of the IAM role for EKS worker nodes"
  value       = aws_iam_role.eks_role.arn
}
