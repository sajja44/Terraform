provider "aws" {
  
}

resource "aws_instance" "demoec2" {
  ami = "ami-02eb7a4783e7e9317"
  instance_type = "t2.micro"
}

