#vpc


resource "aws_vpc" "Name" {
    cidr_block = "10.0.0.0/16"
    tags = {
      Name = "mainvpc"
    }
}
#subnet

resource "aws_subnet" "pub" {
    vpc_id = aws_vpc.Name.id
    availability_zone = "eu-central-1a"
    cidr_block = "10.0.1.0/24"
    map_public_ip_on_launch = true
    tags = {
      Name = "public-subnet"
    }
  
}

resource "aws_subnet" "prv" {
    cidr_block = "10.0.2.0/24"
    vpc_id = aws_vpc.Name.id
    availability_zone = "eu-central-1a"
    }

#internet gatway

resource "aws_internet_gateway" "Name" {
    vpc_id = aws_vpc.Name.id
    tags = {
      Name = "ig_gate"
    }
  
}
#pulic route tables and edit routes

resource "aws_route_table" "pub-rt" {
    vpc_id = aws_vpc.Name.id
    route {
        cidr_block = "0.0.0.0/0"
        gateway_id = aws_internet_gateway.Name.id   
    }
   tags = {
     Name = "public-routetable"
   }
  
}

#aws private route table
resource "aws_route_table" "prv-rt" {
    vpc_id = aws_vpc.Name.id
    route {
        cidr_block = "0.0.0.0/0"
        nat_gateway_id = aws_nat_gateway.nat.id
    }
  tags = {
    Name = "private-routetable"
  }
}

#Associate Public Subnet with Public Route Table

resource "aws_route_table_association" "pub-asso" {
    subnet_id = aws_subnet.pub.id
    route_table_id = aws_route_table.pub-rt.id

    }    
#creating elastic ip

resource "aws_eip" "elastic-ip" {
    domain = "vpc"
  
}

#nat gate

resource "aws_nat_gateway" "nat" {
    subnet_id = aws_subnet.pub.id
    allocation_id = aws_eip.elastic-ip.id    
  
}


#Associate Public Subnet with Public Route Table

resource "aws_route_table_association" "prv-asso" {
    subnet_id = aws_subnet.prv.id
    route_table_id = aws_route_table.prv-rt.id

    }    



    #ec2 creation
    resource "aws_ec2" "name" {
      
    }
#security
# group
