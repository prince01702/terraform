# provider "aws" {
  
# }


# module "vpc" {
#     source = "../../modules/vpc"
#     cidr_block = var.vpc_cidr
#     avaibility_zone = var.avaibility_zone
#     public_subnet_cidr = var.public_subnet_cidr
#     env = var.env
    
# }


# module "ec2" {
#     source = "../../modules/ec2"
#     ami_id = var.ami_id
#     instance_type = var.instance_type
#     subnet_id = module.vpc.public_subnet_id
#     env = var.env
  
# }

provider "aws" {
  region = var.region
  #profile = "test"
}

module "vpc" {
  source              = "../../modules/vpc"
  cidr_block          = var.vpc_cidr
  public_subnet_cidr  = var.public_subnet_cidr
  availability_zone   = var.availability_zone
  env                 = var.env
}


module "ec2" {
  source        = "../../modules/ec2"
  instance_type = var.instance_type
  env           = var.env
  ami_id = var.ami_id
  subnet_id = module.vpc.public_subnet_id
}