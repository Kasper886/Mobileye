# key for node
resource "aws_key_pair" "jenkins" {
  key_name   = "jenkins"
  public_key = file(var.ssh-node["PATH_TO_PUBLIC_KEY"])
}