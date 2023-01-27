# variable "access_key" {
#     type = string
# }

# variable "secret_key" {
#     type = number  
# }


variable "cidr" {
  default = "10.8.0.0/16"
} 

variable "region" {
  type = string 
  default = "ap-south-1"
}