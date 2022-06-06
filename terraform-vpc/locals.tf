locals {
  az_names              = data.aws_availability_zones.available_azs.names
  initkloud_pub_subnets = aws_subnet.initkloud_pub_sn[*].id
  initkloud_prv_subnets = aws_subnet.initkloud_prv_sn[*].id
}

