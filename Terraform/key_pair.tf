data "aws_key_pair" "jenkins" {
  key_name = "virginia"
  filter {
    name   = "tag:Component"
    values = ["web"]
  }
}