resource "aws_elb" "initkloud_elb" {
  name               = "initkloud-elb-${terraform.workspace}"
  subnets = local.initkloud_pub_subnets
  security_groups = [aws_security_group.initkloud_elb_sg.id]


  listener {
    instance_port     = 80
    instance_protocol = "http"
    lb_port           = 80
    lb_protocol       = "http"
  }


  health_check {
    healthy_threshold   = 2
    unhealthy_threshold = 2
    timeout             = 3
    target              = "HTTP:80/index.html"
    interval            = 30
  }

  instances                   = aws_instance.initkloud_web_ec2[*].id
  cross_zone_load_balancing   = true
  idle_timeout                = 400
  connection_draining         = true
  connection_draining_timeout = 400

  tags = {
    Name = "initkloud_elb"
  }
}