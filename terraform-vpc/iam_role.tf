data "template_file" "s3_web_policy" {
  template = file("./scripts/iam/web-ec2-policy.json")
  vars = {
    s3_bucket_arn = "arn:aws:s3:::${var.initkloud_web_app_bucket}/*"
  }
}


resource "aws_iam_role_policy" "initkloud_s3_ec2_policy" {
  name   = "initkloud_s3_ec2_policy"
  role   = aws_iam_role.initkloud_s3_ec2_role.id
  policy = data.template_file.s3_web_policy.rendered
}

resource "aws_iam_role" "initkloud_s3_ec2_role" {
  name               = "initkloud_s3_ec2_role"
  assume_role_policy = file("./scripts/iam/web-ec2-assume-role.json")
}

resource "aws_iam_instance_profile" "initkloud_s3_ec2_instance_profile" {
    name = "initkloud_s3_ec2_instance_profile"
    role = aws_iam_role.initkloud_s3_ec2_role.name
}

