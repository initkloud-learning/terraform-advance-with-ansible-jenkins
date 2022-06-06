variable "deployment_region" {
  type        = string
  default     = "us-east-1"
  description = "AWS Deployment region."
}
variable "deployment_profile" {
  type        = string
  default     = "terraform-initkloud-dev"
  description = "AWS Terraform profile."
}

variable "vpc_cidr_block" {
  type        = string
  default     = "10.0.0.0/16"
  description = "AWS VPC CIDR block."
}
variable "vpc_tags" {
  type = map(string)
  default = {
    Name         = "initkloud_vpc"
    price_tag_id = 120120
    Environment  = "devlopment"
  }
  description = "AWS VPC "
}

variable "nat_ami_ids" {
  type        = map(string)
  description = "AWS AMI ids for Nat instance."
  default = {
    "us-east-1" : "ami-0022f774911c1d690"
    "us-east-2" : "ami-0022f774911c1d690"
  }
}

variable "ec2_web_ami" {
  type        = string
  default     = "ami-0022f774911c1d690"
  description = "AWS web AMI."
}

variable "web_instance_type" {
  type        = string
  default     = "t2.micro"
  description = "AWS web instance type."
}

variable "web_ec2_count" {
  type        = number
  default     = 2
  description = "AWS web instance type."
}

variable "initkloud_web_tags" {
  type = map(string)
  default = {
    Name = "initkloud_web_ec2"
  }
  description = "AWS web instance type."
}

variable "initkloud_web_app_bucket" {
  type        = string
  default     = "initkloud-apache-dev"
  description = "AWS bucket name."
}
