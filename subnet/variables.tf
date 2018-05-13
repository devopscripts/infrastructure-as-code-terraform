variable "availability_zones" {
  # No spaces allowed between az names!
  default = ["ap-southeast-2a","ap-southeast-2b","ap-southeast-2c"]
}
variable "public_subnet_1_cidr" {
  description = "CIDR for the Public Subnet"
  default = "10.0.11.0/24"
}
variable "private_subnet_1_cidr" {
  description = "CIDR for the Private Subnet"
  default = "10.0.21.0/24"
}
variable "public_subnet_2_cidr" {
  description = "CIDR for the Public Subnet"
  default = "10.0.12.0/24"
}
variable "private_subnet_2_cidr" {
  description = "CIDR for the Private Subnet"
  default = "10.0.22.0/24"
}
variable "public_subnet_3_cidr" {
  description = "CIDR for the Public Subnet"
  default = "10.0.13.0/24"
}
variable "private_subnet_3_cidr" {
  description = "CIDR for the Private Subnet"
  default = "10.0.23.0/24"
}

variable "key_name" {}

#
# From module: vpc
#
variable "vpcid" {}
