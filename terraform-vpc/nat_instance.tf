resource "aws_instance" "initkloud_net_instance" {
  ami           = var.nat_ami_ids[var.deployment_region]
  instance_type = "t2.micro"
  subnet_id     = local.initkloud_pub_subnets[0]
  tags = {
    Name = "initkloud_net_instance"
  }

  source_dest_check      = false
  vpc_security_group_ids = [aws_security_group.initkloud_nat_instance_sg.id]

}

