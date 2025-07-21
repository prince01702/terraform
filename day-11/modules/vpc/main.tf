# resource "aws_vpc" "name" {
#     cidr_block = var.cidr_block
#     tags = {
#       Name = "$(var.evn)-vpc"
#     }
  
# }

# resource "aws_subnet" "name" {
#     cidr_block = var.public_subnet_cidr
#     vpc_id = aws_vpc.name.id
#     map_public_ip_on_launch = true
#     availability_zone = var.avaibility_zone
#     tags = {
#       Name = "$(var.env-subnet)"
#     }
  
# }


resource "aws_vpc" "main" {
  cidr_block = var.cidr_block
  
  tags = {
    Name = "${var.env}-vpc"
  }
}


resource "aws_subnet" "public" {
  vpc_id                  = aws_vpc.main.id
  cidr_block              = var.public_subnet_cidr
  availability_zone       = var.availability_zone
  map_public_ip_on_launch = true
  tags = {
    Name = "${var.env}-public-subnet"
  }
}