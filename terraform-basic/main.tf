resource "aws_vpc" "initkloud_vpc" {
  cidr_block       = "10.0.0.0/16"
  instance_tenancy = "default"

  tags = {
    Name        = "initkloud-vpc"
    Environment = "Dev"
    Location    = "India"
  }
}

output "name" {
  value       = aws_vpc.initkloud_vpc.id
  description = "VPC id."
}
