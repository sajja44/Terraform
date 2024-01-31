module "vpc" {
  source = "terraform-aws-modules/vpc/aws"

  name = "my-vpc"
  cidr = "10.0.0.0/16"

  azs = ["ap-south-1a", "ap-south-1b"]
  private_subnets = ["10.0.1.0/24", "10.0.2.0/24"]
  public_subnets = ["10.0.101.0/24", "10.0.102.0/24"]

  tags = {
    Terraform = "true"
    Environment = "dev"
  }
}

resource "aws_security_group" "allow_ssh_conn" {
  name = "allow_ssh_conn"

  description = "Allow SSH inbound traffic"

  ingress  {
    description = "SSH into VPC"
    from_port = 22
    to_port = 22
    protocol = "tcp"
    cidr_blocks = ["0.0.0.0/0"]
  }
  
  ingress {
    description = "HTTP into VPC"
    from_port = 80
    to_port = 80
    protocol = "tcp"
    cidr_blocks = ["0.0.0.0/0"]
  }

  egress {
    description = "Outbound Allowed"
    from_port = 0
    to_port = 65535
    protocol = "tcp"
    cidr_blocks = ["0.0.0.0/0"]
  }
}

resource "aws_instance" "myec2" {
  ami = "ami-02eb7a4783e7e9317"
  instance_type = "t2.micro"
  key_name = "demo"
  vpc_security_group_ids = [aws_security_group.allow_ssh_conn.id]
}

