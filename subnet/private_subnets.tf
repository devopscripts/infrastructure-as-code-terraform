resource "aws_subnet" "private_subnet_1" {
  vpc_id = "${var.vpcid}"
  cidr_block = "${var.private_subnet_1_cidr}"
  availability_zone = "${element(var.availability_zones, 0)}"
  tags {
    Environment = "Test"
    Name = "private_subnet_1"
  }
}
output "private_subnet_1_id" {
  value = "${aws_subnet.private_subnet_1.id}"
}

resource "aws_subnet" "private_subnet_2" {
  vpc_id = "${var.vpcid}"
  cidr_block = "${var.private_subnet_2_cidr}"
  availability_zone = "${element(var.availability_zones, 1)}"
  tags {
    Environment = "Test"
    Name = "private_subnet_2"
  }
}
output "private_subnet_2_id" {
  value = "${aws_subnet.private_subnet_2.id}"
}

resource "aws_subnet" "private_subnet_3" {
  vpc_id = "${var.vpcid}"
  cidr_block = "${var.private_subnet_3_cidr}"
  availability_zone = "${element(var.availability_zones, 2)}"
  tags {
    Environment = "Test"
    Name = "private_subnet_3"
  }
}
output "private_subnet_3_id" {
  value = "${aws_subnet.private_subnet_3.id}"
}

