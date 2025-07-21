#I will create subnet and call ami form amazon and subnet after creating it call via data block



resource "aws_vpc" "name" {
    cidr_block = "10.0.0.0/16"
    tags = {
      Name = "my vpc"
    }
  
}


resource "aws_subnet" "name" {
    cidr_block = "10.0.1.0/24"
    vpc_id = aws_vpc.name
    tags = {
      Name = "sub1"
    }
  
}

resource "aws_subnet" "pub" {
    cidr_block = "10.0.2.0/24"
    vpc_id = aws_vpc.name
    tags = {
      Name = "sub2"
    }
  
}


data "aws_subnet" "name" {
    filter {
      name = "tag:Name"
      values = ["sub1"]
    }
  
}


resource "aws_instance" "name" {
    instance_type = "t2.micro"
    subnet_id = data.aws_subnet.name.id
    ami = "ami-0229b8f55e5178b65"

  
}