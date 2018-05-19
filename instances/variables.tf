variable "region" {}
variable "instance_type" {
  default = "t2.micro"
}
variable "ami" {
  default = {
    ap-southeast-2 = "ami-67589505"
  }
}

variable "key_name" {}
variable "envparm" {} 
variable "public_subnet_1_id" {}
variable "public_subnet_2_id" {}
variable "public_subnet_3_id" {}
variable "private_subnet_1_id" {}
variable "web_access_inbound_sg_id" {}
variable "ssh_access_inbound_sg_id" {}
