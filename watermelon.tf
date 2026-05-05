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

resource "aws_instance" "activity_ec2" {
  ami           = "ami-047126e50991d067b"
  instance_type = "t2.micro"

  tags = {
    Name = "activity-2-terraform-ec2"
  }
}

output "ec2_instance_id" {
  description = "ID of the EC2 instance"
  value       = aws_instance.activity_ec2.id
}

output "ec2_public_ip" {
  description = "Public IP address of the EC2 instance"
  value       = aws_instance.activity_ec2.public_ip
}