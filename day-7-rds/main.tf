resource "aws_db_instance" "rds" {
    identifier = "my-db-rds"
    allocated_storage = 10
    engine = "mysql"  
  engine_version = "8.0.42"
  instance_class = "db.t3.micro"
  db_name = "mydb_rds"
  username = "admin"
  password = "rds123456789"
  db_subnet_group_name =aws_db_subnet_group.subnet_group.name
  skip_final_snapshot = true
  
}


resource "aws_vpc" "name" {
    cidr_block = "10.0.0.0/16"
    tags = {
        Name = "projectvpc"
    }
}

resource "aws_subnet" "prv1" {

    cidr_block = "10.0.1.0/24"
    vpc_id = aws_vpc.name.id
    availability_zone = "eu-central-1b"
    map_public_ip_on_launch = false
    tags = {
        Name = "subnet1-1b"
    }
     
}

resource "aws_subnet" "prv2" {

    cidr_block = "10.0.2.0/24"
    vpc_id = aws_vpc.name.id
    availability_zone = "eu-central-1a"
    map_public_ip_on_launch = false
    tags = {
        Name = "subnet2-1a"
    }
     
}
 resource "aws_db_subnet_group" "subnet_group" {
    subnet_ids = [
  aws_subnet.prv1.id,
  aws_subnet.prv2.id
]
    name = "subnetgroupforrds"
    tags = {
      Name = "rds_subnet_group"
    }


 }