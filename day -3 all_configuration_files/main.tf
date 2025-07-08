resource "aws_instance" "name" {
  instance_type = var.instance_type
  ami = var.ami_id
  key_name = "hello.key"
}