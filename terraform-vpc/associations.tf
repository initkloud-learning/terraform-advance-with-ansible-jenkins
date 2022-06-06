resource "aws_route_table_association" "initkloud_pub_sn_assoc" {
  count          = length(local.az_names)
  subnet_id      = local.initkloud_pub_subnets[count.index]
  route_table_id = aws_route_table.initkloud_pub_rt.id
}

resource "aws_route_table_association" "initkloud_prv_sn_assoc" {
  count          = length(local.initkloud_prv_subnets)
  subnet_id      = local.initkloud_prv_subnets[count.index]
  route_table_id = aws_route_table.initkloud_prv_rt.id
}