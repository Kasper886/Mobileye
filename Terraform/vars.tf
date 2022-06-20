provider "aws" {}

variable "aws_region" {
  default     = "us-east-1"
  description = "aws region where our resources are going to create choose"
  #replace the region as suits for your requirement
}

variable "instance_type" {
  default = "t2.micro"
}

variable "ami_id" {
  default = "ami-09e67e426f25ce0d7"
}

variable "ssh-public-node" {
  type = map(string)
  default = {
    "PATH_TO_PRIVATE_KEY" = "~/MyKey"
    "PATH_TO_PUBLIC_KEY" = "~/MyKey.pub"
  }
}

variable "aws_vpc_cidr" {
  default = "10.10.0.0/16"
}