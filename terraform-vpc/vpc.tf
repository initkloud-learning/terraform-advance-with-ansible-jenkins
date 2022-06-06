resource "aws_vpc" "initkloud_vpc" {
  cidr_block       = var.vpc_cidr_block
  instance_tenancy = "default"
  tags             = var.vpc_tags
}