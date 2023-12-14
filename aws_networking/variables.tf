variable "cidr" {
  type = string
  default = "10.8.0.0/16"
} 

variable "region" {
  type = string 
  default = "ap-south-1"
}

variable "subnet_range" {
    type = list(string)
    default = ["10.8.100.0/24","10.8.220.0/24","10.8.99.0/24"]
}