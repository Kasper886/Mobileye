data "aws_key_pair" "jenkins" {
  filter {
    name   = "tag:mobileye-virginia"
 }
}