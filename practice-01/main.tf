terraform {
  required_providers {
    aws = {
      source  = "hashicorp/aws"
      version = "~> 6.0"
    }
  }

  required_version = ">= 1.12.2"
}

provider "aws" {
  region = "us-east-2"
}

resource "aws_instance" "practice_01" {
  ami           = "ami-08ca1d1e465fbfe0c"
  instance_type = "t3.micro"

  tags = {
    Name = "Practice-01-AWS-Instance"
  }
}