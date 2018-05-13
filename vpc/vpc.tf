resource "aws_vpc" "testvpc" {
  cidr_block = "${var.vpc_cidr}"
  enable_dns_hostnames = true
  tags {
    Name = "testvpc"
  }
}
resource "aws_internet_gateway" "testvpcigw" {
  vpc_id = "${aws_vpc.testvpc.id}"
  tags {
    Name = "testvpc_igw"
  }
}

output "vpcid" {
  value = "${aws_vpc.testvpc.id}"
}

output "igwid" {
  value = "${aws_internet_gateway.testvpcigw.id}"
}
