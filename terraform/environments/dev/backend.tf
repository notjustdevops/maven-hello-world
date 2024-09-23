# /maven-hello-world/terraform/environments/dev/backend.tf

terraform {
  backend "s3" {
    bucket         = "dvorkinguy-kepler-app-terraform-state"
    key            = "dev/global/s3/terraform.tfstate"
    region         = "us-west-2"
    dynamodb_table = "dvorkinguy-kepler-app-terraform-locks"
  }
}
