resource "aws_subnet" "initkloud_pub_sn" {
  count      = length(local.az_names)
  vpc_id     = aws_vpc.initkloud_vpc.id
  cidr_block = cidrsubnet(var.vpc_cidr_block, 8, count.index)

  tags = {
    Name = "initkloud_pub_sn${count.index + 1}"
  }

  availability_zone       = local.az_names[count.index]
  map_public_ip_on_launch = true

}