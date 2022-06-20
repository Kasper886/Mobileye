data "aws_key_pair" "virginia" {
  key_name = "virginia"
  filter {
    name   = "tag:Component"
    values = ["web"]
  }
}