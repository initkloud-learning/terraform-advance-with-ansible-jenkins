resource "aws_internet_gateway" "initkloud_igw" {
  vpc_id = aws_vpc.initkloud_vpc.id
  tags = {
    Name = "initkloud_igw"
  }
}