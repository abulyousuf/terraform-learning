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

resource "aws_instance" "practice_02" {
  ami           = "ami-08ca1d1e465fbfe0c"
  instance_type = "t3.micro"
  vpc_security_group_ids = [
    aws_security_group.sg_ssh.id,
    aws_security_group.sg_https.id
  ]

  tags = {
    Name = "Practice-02-VM-SG"
  }
}

resource "aws_security_group" "sg_ssh" {
  ingress {
    cidr_blocks = ["0.0.0.0/0"]
    protocol    = "tcp"
    from_port   = 22
    to_port     = 22
  }

  egress {
    cidr_blocks = ["0.0.0.0/0"]
    protocol    = "tcp"
    from_port   = 0
    to_port     = 0
  }
}

resource "aws_security_group" "sg_https" {
  ingress {
    cidr_blocks = ["192.168.0.0/16"]
    protocol    = "tcp"
    from_port   = 443
    to_port     = 443
  }

  egress {
    cidr_blocks = ["0.0.0.0/0"]
    protocol    = "tcp"
    from_port   = 0
    to_port     = 0
  }
}