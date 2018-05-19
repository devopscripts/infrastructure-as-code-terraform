provider "aws" {
  region = "${var.region}"
}
module "vpc" {
  source = "./vpc"
  envparm= "${var.envparm}"
}

module "subnet" {
  source = "./subnet"
  vpcid = "${module.vpc.vpcid}"
  envparm= "${var.envparm}"
}
module "route" {
  source = "./route"
  vpcid = "${module.vpc.vpcid}"
  gatewayid = "${module.vpc.igwid}"
  public_subnet_1_id  = "${module.subnet.public_subnet_1_id}"
  public_subnet_2_id  = "${module.subnet.public_subnet_2_id}"
  public_subnet_3_id  = "${module.subnet.public_subnet_3_id}"
  private_subnet_1_id = "${module.subnet.private_subnet_1_id}"
  private_subnet_2_id = "${module.subnet.private_subnet_2_id}"
  private_subnet_3_id = "${module.subnet.private_subnet_3_id}"
  envparm= "${var.envparm}"
}

module "instances" {
  source = "./instances"
  region = "${var.region}"
  public_subnet_1_id  = "${module.subnet.public_subnet_1_id}"
  private_subnet_1_id = "${module.subnet.private_subnet_1_id}"
  ssh_access_inbound_sg_id = "${module.vpc.ssh_access_inbound_sg_id}"
  web_access_inbound_sg_id = "${module.vpc.web_access_inbound_sg_id}"
  key_name = "${var.key_name}"
  envparm= "${var.envparm}"
}


