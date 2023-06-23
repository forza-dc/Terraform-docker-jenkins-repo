# data "aws_iam_instance_profile" "instance_profile" {
#   name = "ec2"
# } 
data "aws_vpc" "vpc_selected" {
  filter {
    name   = "tag:Name"
    values = ["st_vpc"]
  }
}
# data "aws_availability_zone" "az" {
#   #name                   = ""
#   all_availability_zones = true
#   state                  = "available"
# }

data "aws_availability_zone" "az" {
  all_availability_zones = true
  state                  = "available"
  filter {
    name   = "region-name"
    values = ["eu-west-3"]  # Replace with your desired region
  }
  filter {
    name   = "state"
    values = ["available"]
  }
  filter {
    name   = "zone-name"
    values = ["eu-west-3a"]  # Replace with your desired availability zone
  }
}
data "aws_key_pair" "key" {
  key_name = "st-forza-key"
}
data "aws_subnet" "selected" {
  vpc_id  = data.aws_vpc.vpc_selected.id
  availability_zone = "eu-west-3*"
  filter {
    name   = "tag:Name"
    values = ["public_subnet_az_1a"]
  }
}
data "aws_security_groups" "sg" {
  tags = {
    Name = "tcw_security_group"
  }
}