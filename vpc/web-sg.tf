resource "aws_security_group" "web_access_inbound_sg" {
  name = "web_access_http_inbound"
  description = "Allow http from Anywhere"
  ingress {
    from_port = 80
    to_port = 80
    protocol = "tcp"
    cidr_blocks = ["0.0.0.0/0"]
  }
  egress {
    from_port = 0
    to_port = 0
    cidr_blocks = ["0.0.0.0/0"]
  }
  vpc_id = "${aws_vpc.vpc.id}"
  tags {
    Environment = "${var.envparm}"
    Name = "web_access_http_inbound"
  }
}
output "web_access_inbound_sg_id" {
  value = "${aws_security_group.web_access_inbound_sg.id}"
}
