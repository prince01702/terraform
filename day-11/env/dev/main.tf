module "vpc" {
    source = "../../modules/vpc"
    cidr_block = var.cidr_block
    public_subnet_cidr = var.public_subnet_cidr_block
    env = var.env
    availability_zone = var.avaibility_zone
  
}

module "ec2" {
    source = "../../modules/ec2"
    ami_id =  var.ami_id
    instance_type = var.instance_type
    env = var.env
    subnet_id = module.vpc.public_subnet_id
  
}