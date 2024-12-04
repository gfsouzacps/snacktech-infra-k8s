terraform {
  backend "s3" {
    bucket = "snacktech-backend-tfstate-new"
    key    = "iac-eks/terraform.tfstate"
    region = "us-east-1"
  }
}

provider "aws" {
  region = var.regionDefault
}