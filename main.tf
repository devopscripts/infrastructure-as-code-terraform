provider "aws" {
  region = "${var.region}"
}
module "vpc" {
  source = "./vpc"
  envparm= "${var.envparm}"
}

module "subnet" {
  source = "./subnet"
  key_name = "${var.key_name}"
  vpcid = "${module.vpc.vpcid}"
  envparm= "${var.envparm}"
}
module "route" {
  source = "./route"
  vpcid = "${module.vpc.vpcid}"
  gatewayid = "${module.vpc.igwid}"
  envparm= "${var.envparm}"
}


