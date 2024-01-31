resource "aws_instance" "myec2" { 
  ami = "ami-02eb7a4783e7e9317"
  instance_type = "t2.micro"
  key_name = "demo"

  connection {
    type     = "ssh"
    user     = "ubuntu"
    private_key = file("./demo.pem")
    host     = self.public_ip
  }

  provisioner "remote-exec" {
    inline = [
      "sudo apt install -y ngnix",
      "sudo systemctl start nginx",
    ]
  }
}

