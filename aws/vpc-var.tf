variable "name" {
  default = "Terraform"
}

# variable "allow_ip" {}

variable "user_names" {
    type = list
    default = ["test-user","dev-test-user","prod-user"]
  
}

variable "env" {
  default = false
}
