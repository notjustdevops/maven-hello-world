# /home/notjust/Documents/devops/Projects/Rafael/maven-hello-world/terraform/modules/iam/main.tf

provider "aws" {
  region = var.aws_region
}

# Get AWS account ID for use in policies
data "aws_caller_identity" "current" {}

# IAM Role for EKS
resource "aws_iam_role" "eks_role" {
  name               = "${var.resource_prefix}-eks-role"
  assume_role_policy = data.aws_iam_policy_document.eks_assume_role.json

  tags = merge(
    var.tags,
    {
      Name = "${var.resource_prefix}-eks-role"
    }
  )
}

resource "aws_iam_role_policy_attachment" "eks_policy_attachment" {
  role       = aws_iam_role.eks_role.name
  policy_arn = "arn:aws:iam::aws:policy/AmazonEKSWorkerNodePolicy"
}

resource "aws_iam_role_policy_attachment" "eks_cni_policy_attachment" {
  role       = aws_iam_role.eks_role.name
  policy_arn = "arn:aws:iam::aws:policy/AmazonEKS_CNI_Policy"
}

resource "aws_iam_role_policy_attachment" "eks_registry_policy_attachment" {
  role       = aws_iam_role.eks_role.name
  policy_arn = "arn:aws:iam::aws:policy/AmazonEC2ContainerRegistryReadOnly"
}

# IAM Role for ArgoCD
resource "aws_iam_role" "argocd_role" {
  name               = "${var.resource_prefix}-argocd-role"
  assume_role_policy = data.aws_iam_policy_document.argocd_assume_role.json

  tags = merge(
    var.tags,
    {
      Name = "${var.resource_prefix}-argocd-role"
    }
  )
}

# Policy document for assuming role (IRSA, using sts.amazonaws.com)
data "aws_iam_policy_document" "argocd_assume_role" {
  statement {
    actions = ["sts:AssumeRole"]
    principals {
      type        = "Service"
      identifiers = ["sts.amazonaws.com"]
    }
  }
}

# Terraform Backend IAM Role for S3 and DynamoDB
resource "aws_iam_role" "terraform_backend_role" {
  name               = "${var.resource_prefix}-terraform-backend-role"
  assume_role_policy = data.aws_iam_policy_document.terraform_assume_role.json

  tags = merge(
    var.tags,
    {
      Name = "${var.resource_prefix}-terraform-backend-role"
    }
  )
}

data "aws_iam_policy_document" "terraform_assume_role" {
  statement {
    actions = ["sts:AssumeRole"]
    principals {
      type        = "Service"
      identifiers = ["ec2.amazonaws.com"]
    }
  }
}

resource "aws_iam_role_policy" "terraform_s3_policy" {
  name   = "${var.resource_prefix}-terraform-s3-policy"
  role   = aws_iam_role.terraform_backend_role.id
  policy = data.aws_iam_policy_document.s3_policy.json
}

data "aws_iam_policy_document" "s3_policy" {
  statement {
    actions = [
      "s3:GetObject",
      "s3:PutObject",
      "s3:DeleteObject",
      "s3:ListBucket"
    ]
    resources = [
      "arn:aws:s3:::${var.s3_bucket_name}",
      "arn:aws:s3:::${var.s3_bucket_name}/*"
    ]
  }
}

resource "aws_iam_role_policy" "terraform_dynamodb_policy" {
  name   = "${var.resource_prefix}-terraform-dynamodb-policy"
  role   = aws_iam_role.terraform_backend_role.id
  policy = data.aws_iam_policy_document.dynamodb_policy.json
}

data "aws_iam_policy_document" "dynamodb_policy" {
  statement {
    actions = [
      "dynamodb:PutItem",
      "dynamodb:DeleteItem",
      "dynamodb:GetItem",
      "dynamodb:Scan",
      "dynamodb:Query"
    ]
    resources = [
      "arn:aws:dynamodb:${var.aws_region}:${var.account_id}:table/${var.dynamodb_table_name}"
    ]
  }
}


# IAM Role for Grafana
resource "aws_iam_role" "grafana_role" {
  name               = "${var.resource_prefix}-grafana-role"
  assume_role_policy = data.aws_iam_policy_document.grafana_assume_role.json

  tags = merge(
    var.tags,
    {
      Name = "${var.resource_prefix}-grafana-role"
    }
  )
}

data "aws_iam_policy_document" "grafana_assume_role" {
  statement {
    actions = ["sts:AssumeRole"]
    principals {
      type        = "Service"
      identifiers = ["grafana.amazonaws.com"]
    }
  }
}

resource "aws_iam_role_policy" "grafana_cloudwatch_policy" {
  name   = "${var.resource_prefix}-grafana-cloudwatch-policy"
  role   = aws_iam_role.grafana_role.id
  policy = data.aws_iam_policy_document.cloudwatch_policy.json
}

data "aws_iam_policy_document" "cloudwatch_policy" {
  statement {
    actions = [
      "cloudwatch:ListMetrics",
      "cloudwatch:GetMetricData",
      "cloudwatch:GetMetricStatistics",
      "cloudwatch:DescribeAlarms",
      "cloudwatch:DescribeAlarmHistory"
    ]
    resources = ["*"]
  }
}

# IAM Policy Document for assuming role (EKS)
data "aws_iam_policy_document" "eks_assume_role" {
  statement {
    actions = ["sts:AssumeRole"]
    principals {
      type        = "Service"
      identifiers = ["eks.amazonaws.com", "ec2.amazonaws.com"]  # Ensure EC2 is included
    }
  }
}


#resource "aws_iam_role" "eks_worker_role" {
#  name               = "${var.resource_prefix}-eks-worker-role"
#  assume_role_policy = data.aws_iam_policy_document.eks_assume_role.json
#
#  tags = merge(
#    var.tags,
#    {
#      Name = "${var.resource_prefix}-eks-worker-role"
#    }
#  )
#}
#