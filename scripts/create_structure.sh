#!/bin/bash

# Define the directory structure
dirs=(
  "helm/templates"
  "terraform/environments/dev"
  "terraform/modules/eks"
  "terraform/modules/vpc"
  "terraform/modules/ingress"
  "terraform/modules/argocd"
  "terraform/modules/grafana"
  "terraform/modules/route53"
  "terraform/modules/iam"
  "terraform/modules/dynamodb"
  "terraform/modules/s3"
  "terragrunt/dev"
)

# Create the directories
echo "Creating directory structure..."
for dir in "${dirs[@]}"; do
  if [ ! -d "$dir" ]; then
    mkdir -p "$dir"
    echo "Created directory: $dir"
  else
    echo "Directory already exists: $dir"
  fi
done

# Define the files to be created (touch will create empty files)
files=(
  "helm/Chart.yaml"
  "helm/values.yaml"
  "helm/templates/deployment.yaml"
  "helm/templates/service.yaml"
  "helm/templates/ingress.yaml"
  "helm/templates/_helpers.tpl"
  "terraform/environments/dev/terraform.tfvars"
  "terraform/environments/dev/backend.tf"
  "terraform/environments/dev/main.tf"
  "terraform/environments/dev/outputs.tf"
  "terraform/environments/dev/variables.tf"
  "terragrunt/dev/terragrunt.hcl"
  "terragrunt/terragrunt.hcl"
)

# Create the files
echo "Creating files..."
for file in "${files[@]}"; do
  if [ ! -f "$file" ]; then
    touch "$file"
    echo "Created file: $file"
  else
    echo "File already exists: $file"
  fi
done

echo "Folder and file creation completed!"

