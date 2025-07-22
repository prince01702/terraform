module "vpc" {
    source = "../../modules/vpc"
    cidr_block = var.cidr_block
    availability_zone = var.avability_zone
    public_subnet_cidr = var.public_subnet_cidr_block
    env = var.env
  
}

module "ec2" {
    source = "../../modules/ec2"
    ami_id = var.ami_id
    instance_type = var.instance_type
    subnet_id = module.vpc.public_subnet_id
    env = var.env
  
}