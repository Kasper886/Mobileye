provider "aws" {}

variable "aws_region" {
  default     = "us-east-1"
  description = "aws region where our resources are going to create choose"
  #replace the region as suits for your requirement
}

variable "instance_type" {
  default = "t3.micro"
}

variable "ami_id" {
  default = "ami-09e67e426f25ce0d7"
}