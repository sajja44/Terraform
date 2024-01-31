resource "aws_instance" "demoec2" {
  ami = "ami-02eb7a4783e7e9317"
  instance_type = "t2.micro"
}

resource "aws_eip" "lb" {
  instance = aws_instance.demoec2
}

resource "aws_security_group" "allow_tls" {
  name = "allow_tls"

  ingress {
    description = "TLS from VPC"
    from_port = 443
    to_port = 443
    protocol = "tcp"
    cidr_blocks = ["${aws_eip.lb.private_ip}/32"]
  }
}

