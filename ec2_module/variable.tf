variable "ami_id" {
  type    = string
  default = "ami-008bcc0a51a849165"
}
variable "instance_type" {
  type    = string
  default = "t2.medium"
}
variable "associate_public_ip" {
  type    = bool
  default = true
}
variable "az" {
  type    = string
  default = "eu-west-3"
}
variable "disable_api_termination" {
  type    = bool
  default = false
}
variable "instance_profile" {
  type    = string
  default = "ec2"
}
variable "key" {
  type    = string
  default = "st-forza-key"
}
variable "sg" {
  type    = list(any)
  default = ["sg-0858149edde4ae5ae"]
}
variable "subnet_id" {
  type    = string
  default = "subnet-03a2ea8c56ec8a1f2"
}
variable "volume_size" {
  type    = number
  default = 100
}
variable "application" {
  type    = string
  default = "new-prod"
}
variable "organization" {
  type    = string
  default = "production"
}