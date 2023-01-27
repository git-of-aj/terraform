resource "aws_vpc" "mumbai_vpc" {
  cidr_block       = ["var.cidr"]
  instance_tenancy = "default"
  # region = [var.region]

  tags = {
    terraform = "resource"
  }
}