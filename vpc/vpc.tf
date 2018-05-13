resource "aws_vpc" "vpc" {
  cidr_block = "${var.vpc_cidr}"
  enable_dns_hostnames = true
  tags {
    Name = "${var.envparm}vpc"
    Environment = "${var.envparm}"
  }
}
resource "aws_internet_gateway" "vpcigw" {
  vpc_id = "${aws_vpc.vpc.id}"
  tags {
    Name = "${var.envparm}vpc_igw"
    Environment = "${var.envparm}"
  }
}

output "vpcid" {
  value = "${aws_vpc.vpc.id}"
}

output "igwid" {
  value = "${aws_internet_gateway.vpcigw.id}"
}
