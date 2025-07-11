#vpc


resource "aws_vpc" "name" {
    cidr_block = "10.0.0.0/16"
    tags = {
      name = "mainvpc"
    }
}
#subnet

resource "aws_subnet" "pub" {
    vpc_id = aws_vpc.name.id
    availability_zone = "us-central-1"
    cidr_block = "10.0.1.0/24"
    map_public_ip_on_launch = true
    tags = {
      name = "public-subnet"
    }
  
}

resource "aws_subnet" "prv" {
    cidr_block = "10.0.2.0/24"
    vpc_id = aws_vpc.name.id
    availability_zone = "us-central-1"
    tags = {
      name = "private-subnet"
    }
}
#internet gatway

resource "aws_internet_gateway" "name" {
    vpc_id = aws_vpc.name.id
    tags = {
      name = "ig_gate"
    }
  
}
#route tables and edit routes

resource "aws_route_table" "pub-rt" {
    vpc_id = aws_vpc.name.id
    route {
        cidr_block = "0.0.0.0/0"
        gateway_id = aws_internet_gateway.name.id   
    }
   tags = {
     name = "public-routetable"
   }
  
}


resource "aws_route_table" "prv-rt" {
    vpc_id = aws_vpc.name.id
    route {
        cidr_block = "0.0.0.0/0"
        gateway_id = aws_internet_gateway.name.id
    }
  tags = {
    name = "private-routetable"
  }
}

#Associate Public Subnet with Public Route Table

resource "aws_route_table_association" "pub-asso" {
    subnet_id = aws_subnet.pub.id
    route_table_id = aws_route_table.pub-rt

    }    


#nat gate
#security group
