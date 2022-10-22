terraform {
  required_providers {
    aws = {
      source  = "hashicorp/aws"
      version = "4.9.0"
    }
  }
}

provider "aws" {
  region = var.region
  profile = var.profile_name
}

resource "aws_instance" "tf-ec2" {
  ami           = var.ami
  instance_type = var.instance_type
  tags = {
    "Name" = "created-by-tf"
  }
}




