# key for node
resource "aws_key_pair" "MyKey" {
  key_name   = "MyKey"
  public_key = file(var.ssh-node["PATH_TO_PUBLIC_KEY"])
}