resource "aws_iam_user" "iam" {
  for_each = toset(["venkat", "surya",  "sudha"])
  name = each.key
}



resource "aws_instance" "demoec2" {
  ami = "ami-02eb7a4783e7e9317"
  for_each = {
    key1 = "t2.micro"
    key2 = "t2.medium"
  }
  instance_type = each.value
  key_name = each.key
  tags = {
    Name = each.value
  }
}




