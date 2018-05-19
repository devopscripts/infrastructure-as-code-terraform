resource "aws_instance" "haproxy_1" {
  ami = "${lookup(var.ami, var.region)}"
  instance_type = "t2.micro"
  subnet_id = "${var.public_subnet_1_id}"
  key_name = "${var.key_name}"
  vpc_security_group_ids = [
    "${var.web_access_inbound_sg_id}",
    "${var.ssh_access_inbound_sg_id}"
  ]
  user_data = <<-EOF
              #!/bin/bash
              echo '123' |sudo passwd root --stdin
              yum install haproxy -y
              systemctl enable haproxy
              EOF
  tags = {
    name = "haproxy_1"
    Environment = "${var.envparm}"
  }
}
