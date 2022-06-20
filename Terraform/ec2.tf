resource "aws_instance" "web-server" {
  ami                    = var.ami_id
  instance_type          = var.instance_type
  key_name               = data.aws_key_pair.jenkins.key_name
  subnet_id              = aws_subnet.public.id
  vpc_security_group_ids = [aws_security_group.web-servers.id]
  user_data              = file("user_data.sh")

  tags = {
    Name = "Jenkins Server Build by Terraform"
    Owner = "Alex Largman"
  }
}