resource "aws_vpc" "this" {
  cidr_block       = var.cidr

  tags = {
    Name = "VPC_VIA_IaC",
    Created_Via = "Terraform"
  }
}

output "vpc_details" {
    value = {
    arn = aws_vpc.this.arn
    id = aws_vpc.this.id
    }
    
}

resource "aws_subnet" "main" {
  vpc_id     = aws_vpc.this.id
  cidr_block = "10.8.1.0/24"
  tags = {
      Name = "subnet-demo"
  }
 }

resource "aws_subnet" "sub1" {
depends_on = [ aws_vpc.this ]
count = length(var.subnet_range)
  vpc_id     = aws_vpc.this.id
  cidr_block = var.subnet_range[count.index]
  tags = {
  Name   = "subnet-${count.index}"
  }
  
}