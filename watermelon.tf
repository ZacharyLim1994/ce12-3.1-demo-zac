provider "aws" {
  region = var.aws_region
}

terraform {
  backend "s3" {
    bucket = "sctp-ce12-tfstate-bucket"
    key    = "activity-2/ec2/terraform.tfstate"
    region = "ap-southeast-1"
  }
}

variable "aws_region" {
  description = "AWS region to deploy resources into"
  type        = string
  default     = "ap-southeast-1"
}

resource "aws_s3_bucket" "activity_bucket" {
  bucket = "zaclim-activity-2-basic-bucket-20260505"

  tags = {
    Name        = "Activity 2 Basic Bucket"
    Environment = "Dev"
  }
}

output "s3_bucket_name" {
  description = "Name of the created S3 bucket"
  value       = aws_s3_bucket.activity_bucket.bucket
}
