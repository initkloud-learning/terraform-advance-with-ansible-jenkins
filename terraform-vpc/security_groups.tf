resource "aws_security_group" "initkloud_nat_instance_sg" {
  name        = "initkloud_nat_instance_sg"
  description = "Allow traffic for private subnets."
  vpc_id      = aws_vpc.initkloud_vpc.id

  egress {
    from_port = 0
    to_port   = 0
    protocol  = "-1"

    cidr_blocks = ["0.0.0.0/0"]
  }
}

resource "aws_security_group" "initkloud_web_instance_sg" {
  name        = "initkloud_web_instance_sg"
  description = "Allow traffic for web instance."
  vpc_id      = aws_vpc.initkloud_vpc.id
  ingress {
    from_port = 80
    to_port   = 80
    protocol  = "tcp"
    cidr_blocks = ["0.0.0.0/0"]
  }
  ingress {
    from_port = 22
    to_port   = 22
    protocol  = "tcp"
    cidr_blocks = ["0.0.0.0/0"]
  }  
  egress {
    from_port = 0
    to_port   = 0
    protocol  = "-1"

    cidr_blocks = ["0.0.0.0/0"]
  }
}


resource "aws_security_group" "initkloud_elb_sg" {
  name        = "initkloud_elb_sg"
  description = "Allow traffic for ELB."
  vpc_id      = aws_vpc.initkloud_vpc.id
  ingress {
    from_port = 80
    to_port   = 80
    protocol  = "tcp"
    cidr_blocks = ["0.0.0.0/0"]
  }

  egress {
    from_port = 80
    to_port   = 80
    protocol  = "tcp"
    cidr_blocks = ["0.0.0.0/0"]
  }
}