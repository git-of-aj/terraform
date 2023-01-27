terraform {
  required_providers {
    aws = {
        source = "hashicorp/aws"
       # version = specify your version
    }
  }
}

provider "aws" {
    access_key = "xxxxxxxxxxxxxxxxxxxxx"
    secret_key = "xxxxxxxxxxxxxxxxxxxxxxxxxxxx9"
   
} 
