resource "aws_instance" "web_server_1" {
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
              yum install httpd -y
              echo "web server 111111111111" > /var/www/html/index.html
              systemctl enable httpd
              systemctl restart httpd
              EOF
  tags = {
    name = "web_server1"
    Environment = "${var.envparm}"
  }
}

resource "aws_instance" "web_server_2" {
  ami = "${lookup(var.ami, var.region)}"
  instance_type = "t2.micro"
  subnet_id = "${var.public_subnet_2_id}"
  key_name = "${var.key_name}"
  vpc_security_group_ids = [
    "${var.web_access_inbound_sg_id}",
    "${var.ssh_access_inbound_sg_id}"
  ]
  user_data = <<-EOF
              #!/bin/bash
              echo '123' |sudo passwd root --stdin
              yum install httpd -y
              echo "web server 22222222222222" > /var/www/html/index.html
              systemctl enable httpd
              systemctl restart httpd
              EOF
  tags = {
    name = "web_server2"
    Environment = "${var.envparm}"
  }
}

resource "aws_instance" "web_server_3" {
  ami = "${lookup(var.ami, var.region)}"
  instance_type = "t2.micro"
  subnet_id = "${var.public_subnet_3_id}"
  key_name = "${var.key_name}"
  vpc_security_group_ids = [
    "${var.web_access_inbound_sg_id}",
    "${var.ssh_access_inbound_sg_id}"
  ]
  user_data = <<-EOF
              #!/bin/bash
              echo '123' |sudo passwd root --stdin
              yum install httpd -y
              echo "web server 3333333333" > /var/www/html/index.html
              systemctl enable httpd
              systemctl restart httpd
              EOF
  tags = {
    name = "web_server3"
    Environment = "${var.envparm}"
  }
}

