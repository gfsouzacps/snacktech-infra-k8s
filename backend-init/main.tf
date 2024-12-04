variable "bucketName" {
    type = string
    default = "snacktech-backend-tfstate-new"
}

provider "aws" {
  region = "us-east-1"
}

# Create an S3 bucket
resource "aws_s3_bucket" "my_bucket" {
  bucket = var.bucketName
}