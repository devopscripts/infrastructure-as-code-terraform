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
              echo "frontend haproxy_in" >> /etc/haproxy/haproxy.cfg
              echo "    bind *:80      " >> /etc/haproxy/haproxy.cfg
              echo "    default_backend haproxy_http" >> /etc/haproxy/haproxy.cfg
              echo "backend haproxy_http          " >> /etc/haproxy/haproxy.cfg
              echo "    balance roundrobin   " >> /etc/haproxy/haproxy.cfg
              echo "    mode http   " >> /etc/haproxy/haproxy.cfg
              echo "    server web1 ${aws_instance.web_server1.private_ip} " >> /etc/haproxy/haproxy.cfg
              echo "    server web2 ${aws_instance.web_server2.private_ip} " >> /etc/haproxy/haproxy.cfg
              echo "    server web3 ${aws_instance.web_server3.private_ip} " >> /etc/haproxy/haproxy.cfg
              systemctl restart haproxy
              EOF
  tags = {
    name = "haproxy_1"
    Environment = "${var.envparm}"
  }
}
