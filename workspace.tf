resource "aws_instance" "myec2" { 
  ami = "ami-02eb7a4783e7e9317"
  instance_type = lookup( var.instance_type,terraform.workspace )
}

variable "instance_type" {
  type = map
  default = {
    default = "t2.micro"
    dev = "t2.small"
  }
}