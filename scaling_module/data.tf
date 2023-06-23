######################################################
## Data to fetch VPC details
######################################################

data "aws_vpc" "vpc_selected" {
  filter {
    name   = "tag:Name"
    values = ["st_vpc"]
  }
}
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
# data "aws_availability_zone" "az" {
#   all_availability_zones = false
#   name = "eu-west-3a"
#   state                  = "available"
# }

###################################################################
## Data to be fetched for subnets
##################################################################
data "aws_subnet_ids" "available_db_subnet" {
  vpc_id = data.aws_vpc.vpc_selected.id
  filter {
    name   = "tag:Name"
    values = ["public_subnet_az_1*"]
  }
}

#  data "aws_subnet" "private" {
#   for_each = data.aws_subnet_ids.private1.ids
#   id       = each.value
# }
data "aws_security_groups" "sg" {
  tags = {
    Name = "tcw_security_group"
  }
}