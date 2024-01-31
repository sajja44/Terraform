resource "aws_instance" "myec2" { 
  ami = "ami-02eb7a4783e7e9317"
  instance_type = "t2.micro"

  provisioner "local-exec" {
  command = "echo ${aws_instance.myec2.private_ip} >> private_ips.txt"
  }
}



