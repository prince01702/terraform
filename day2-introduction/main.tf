resource "aws_instance" "name" {
  ami = "ami-0229b8f55e5178b65"
  key_name = "hello.key"
  instance_type = "t2.micro"
}