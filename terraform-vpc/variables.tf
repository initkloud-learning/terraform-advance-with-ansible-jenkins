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
    "us-east-2" : "ami-07e28d2a4c873cf5c"
  }
}