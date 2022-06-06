resource "aws_route_table" "initkloud_pub_rt" {
  vpc_id = aws_vpc.initkloud_vpc.id
  route {
    cidr_block = "0.0.0.0/0"
    gateway_id = aws_internet_gateway.initkloud_igw.id
  }

  tags = {
    Name = "initkloud_pub_rt"
  }
}


resource "aws_route_table" "initkloud_prv_rt" {
  vpc_id = aws_vpc.initkloud_vpc.id
  route {
    cidr_block  = "0.0.0.0/0"
    instance_id = aws_instance.initkloud_net_instance.id
  }

  tags = {
    Name = "initkloud_prv_rt"
  }
}