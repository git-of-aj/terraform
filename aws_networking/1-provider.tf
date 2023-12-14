terraform {
  required_providers {
    aws = {
      source = "hashicorp/aws"
      version = "5.30.0"
    }
  }
}

provider "aws" {
  # Configuration options
  # access_key = ""
 # secret_key = ""
 region = "eu-west-2"
}