terraform {
  required_providers {
    aws = {
      source = "hashicorp/aws"
      version = "4.29.0"
    }
  }
}

provider "aws" {
  region  = "us-east-1"
  access_key = var.access_key
  secret_key = var.secret_key
  ## profile = "my-profile"
}

resource "aws_instance" "tf-ec2" {
  ami           = "ami-0c95d38b24a19de18"
  instance_type = "t2.micro"
  tags = {
    "Name" = "created-by-tf"
  }
}
