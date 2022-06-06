locals {
  env_tag = {
    Environment = terraform.workspace
  }

  web_tag = merge(var.initkloud_web_tags, local.env_tag)
}
resource "aws_instance" "initkloud_web_ec2" {
  count         = var.web_ec2_count
  ami           = var.ec2_web_ami
  instance_type = var.web_instance_type

  vpc_security_group_ids = [aws_security_group.initkloud_web_instance_sg.id]

  tags = local.web_tag
  key_name = "terraform-learning"

  subnet_id = local.initkloud_pub_subnets[count.index]
  user_data = file("./scripts/apache.sh")

  iam_instance_profile = aws_iam_instance_profile.initkloud_s3_ec2_instance_profile.name

}