variable "region" {
  default = "ap-southeast-2"
}
variable "vpc_cidr" {
  description = "CIDR for the Public Subnet"
  default = "10.0.0.0/16"
}
variable "key_name" {
  default = "devopssyd"
}
