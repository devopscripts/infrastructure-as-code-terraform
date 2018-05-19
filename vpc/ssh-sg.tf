resource "aws_security_group" "ssh_access_inbound_sg" {
  name = "ssh_access_inbound"
  description = "Allow SSH from Anywhere"
  ingress {
    from_port = 22
    to_port = 22
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
    Name = "ssh_access_ssh_inbound"
  }
}
output "ssh_access_inbound_sg_id" {
  value = "${aws_security_group.ssh_access_inbound_sg.id}"
}
