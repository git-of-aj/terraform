terraform {
  required_providers {
    aws = {
      source = "hashicorp/aws"
      version = "5.13.1"
    }
  }
}

provider "aws" {
  # Configuration options
region = "ap-northeast-1"
}
/*
resource "aws_vpc" "vpc-1" {
  cidr_block = "10.0.0.0/16"
}

resource "aws_subnet" "main" {
  vpc_id     = aws_vpc.vpc-1.id
  cidr_block = "10.0.1.0/24"
# owner_id and #arn are attributes
 # This give subnet name of main...
  tags = {
    Name = "Main"
  }
}

# Creates Elatic IP unattached 
resource "aws_eip" "lb" {
  domain   = aws_vpc.vpc-1.id
}
*/

resource "aws_security_group" "sg" {
  name        = "allow_tls"
  description = "Allow TLS inbound traffic"
  vpc_id      = aws_vpc.vpc-1.id

  ingress {
    description      = "TLS from VPC"
    from_port        = 443
    to_port          = 443
    protocol         = "tcp"
    cidr_blocks      = var.allow_ip
  }

  egress {
    from_port        = 0
    to_port          = 0
    protocol         = "-1"
    cidr_blocks      = ["0.0.0.0/0"]
  }

  tags = {
    Name = var.name
  }
}

/*
resource "aws_iam_user" "lb" {
  name = "loadbalancer-${count.index}"
  count = 3

  tags = {
    tag-key = "terraform demo"
  }
}
*/
resource "aws_iam_group" "grp" {
  name = var.user_names[count.index]
  count = var.env ? 3:1 
  # mangu = aansh => confirm using tf validate cmd
  
}
# Output of above
# terraform plan -var="env=true" 
# Plan: 3 to add, 0 to change, 0 to destroy.
