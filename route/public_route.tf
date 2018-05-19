resource "aws_route_table" "Public" {
  vpc_id = "${var.vpcid}"
  route {
    cidr_block = "0.0.0.0/0"
    gateway_id = "${var.gatewayid}"
  }
  tags {
    Environment = "${var.envparm}"
    Name =  "Public_route_table"
  }
}
output "Public_routeTB_id" {
  value = "${aws_route_table.Public.id}"
}
