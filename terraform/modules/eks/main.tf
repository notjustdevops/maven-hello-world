# path: /maven-hello-world/terraform/modules/eks/main.tf

provider "aws" {
  region = var.aws_region
}

# EKS Cluster creation
resource "aws_eks_cluster" "eks_cluster" {
  name     = var.eks_cluster_name
  version  = var.eks_cluster_version
  role_arn = var.eks_role_arn

  vpc_config {
    subnet_ids = var.public_subnets
  }
}


# Automatically map IAM roles to the Kubernetes cluster
resource "null_resource" "eks_aws_auth" {
  provisioner "local-exec" {
    command = <<EOT
    cat <<EOF | kubectl apply -f -
apiVersion: v1
kind: ConfigMap
metadata:
  name: aws-auth
  namespace: kube-system
data:
  mapRoles: |
    - rolearn: arn:aws:iam::${var.account_id}:role/${var.resource_prefix}-eks-role
      username: system:node:{{EC2PrivateDNSName}}
      groups:
        - system:bootstrappers
        - system:nodes
    - rolearn: arn:aws:iam::${var.account_id}:role/${var.resource_prefix}-eks-worker-role
      username: eks-worker-role
      groups:
        - system:masters
EOF
    EOT
  }

  depends_on = [aws_eks_cluster.eks_cluster]
}

# Grant admin access to the EKS IAM role in the Kubernetes cluster
resource "null_resource" "eks_cluster_admin_rbac" {
  provisioner "local-exec" {
    command = <<EOT
    cat <<EOF | kubectl apply -f -
apiVersion: rbac.authorization.k8s.io/v1
kind: ClusterRoleBinding
metadata:
  name: eks-cluster-admin-binding
roleRef:
  apiGroup: rbac.authorization.k8s.io
  kind: ClusterRole
  name: cluster-admin
subjects:
  - kind: User
    name: arn:aws:iam::${var.account_id}:role/${var.resource_prefix}-eks-role
    apiGroup: rbac.authorization.k8s.io
EOF
    EOT
  }

  depends_on = [aws_eks_cluster.eks_cluster]
}



# EKS Node Group
resource "aws_eks_node_group" "eks_node_group" {
  cluster_name    = aws_eks_cluster.eks_cluster.name
  node_group_name = "${var.resource_prefix}-node-group"
  node_role_arn   = var.eks_worker_role_arn
  subnet_ids      = var.public_subnets
  instance_types  = [var.eks_instance_type]

  scaling_config {
    desired_size = var.eks_desired_capacity
    min_size     = var.eks_min_capacity
    max_size     = var.eks_max_capacity
  }

  depends_on = [aws_eks_cluster.eks_cluster]
}

# IAM Role for EKS worker nodes
resource "aws_iam_role" "eks_worker_role" {
  name               = "${var.resource_prefix}-eks-worker-role"
  assume_role_policy = data.aws_iam_policy_document.eks_assume_role.json

  tags = merge(
    var.tags,
    {
      Name = "${var.resource_prefix}-eks-worker-role"
    }
  )
}

# Policy document for EKS worker role
data "aws_iam_policy_document" "eks_assume_role" {
  statement {
    actions = ["sts:AssumeRole"]
    principals {
      type        = "Service"
      identifiers = ["ec2.amazonaws.com"]  # EC2 service to assume the role
    }
  }
}
