resource "aws_security_group" "initkloud_nat_instance_sg"{
    name = "initkloud_nat_instance_sg"
    description = "Allow traffic for private subnets."
    vpc_id = aws_vpc.initkloud_vpc.id

    egress {
        from_port = 0
        to_port = 0
        protocol = "-1"

        cidr_blocks = ["0.0.0.0/0"]
    }
}