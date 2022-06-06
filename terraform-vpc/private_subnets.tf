resource "aws_subnet" "initkloud_prv_sn" {
  count  = length(slice(local.az_names, 0, 2))
  vpc_id = aws_vpc.initkloud_vpc.id
  cidr_block = cidrsubnet(
    var.vpc_cidr_block, 8, count.index + length(local.az_names)
  )

  tags = {
    Name = "initkloud_prv_sn${count.index + 1}"
  }

  availability_zone = local.az_names[count.index]

}