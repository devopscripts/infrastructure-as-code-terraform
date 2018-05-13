provider "aws" {
  region = "${var.region}"
}
#data "terraform_remote_state" "state" {
#  backend = "s3"
#  config {
#    bucket        = "${var.bucketname}"
#    region        = "${var.region}"
#    key           = "terraform.tfstate"
#  }
#}
module "vpc" {
  source = "./vpc"
}

module "subnet" {
  source = "./subnet"
  key_name = "${var.key_name}"
  vpcid = "${module.vpc.vpcid}"
}
module "route" {
  source = "./route"
  vpcid = "${module.vpc.vpcid}"
  gatewayid = "${module.vpc.igwid}"
}


