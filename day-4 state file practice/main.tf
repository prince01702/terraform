provider "aws" {
  
}


resource "aws_instance" "dev1" {
    instance_type = t2.micro
    ami = ami-0229b8f55e5178b65
    count = 2
}