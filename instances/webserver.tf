resource "aws_instance" "web_server_1" {
  ami = "${lookup(var.ami, var.region)}"
  instance_type = "t2_micro"
  tages = {
    name = "web_server1"
    Environment = "${var.envparm}"
  }
  subnet_id = "${var.public_subnet_1_id}"
  key_name = "${var.key_name}"
  vpc_security_group_ids = [
    "${var.web_access_inbound_sg_id}",
    "${var.ssh_access_inbound_sg_id}"
  ]
}

