# resource "aws_instance" "name" {
#     ami = var.ami_id
#     instance_type = var.instance_type
#     subnet_id = var.subnet_id
#     tags = {
#       Name = "$(var.env)-ec2"
#     }

# }


resource "aws_instance" "app" {
  ami           = var.ami_id
  instance_type = var.instance_type
  subnet_id     = var.subnet_id
  tags = {
    Name = "${var.env}-ec2"
  }
}