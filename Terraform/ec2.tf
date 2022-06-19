resource "aws_instance" "web-server" {
  ami                    = var.ami_id
  instance_type          = var.instance_type
  key_name               = "mobileye-virginia"
  subnet_id              = aws_subnet.public.id
  vpc_security_group_ids = [aws_security_group.web-servers.id]
  user_data              = <<EOF
#!/bin/bash
sudo apt update
sudo apt install -y apt-transport-https ca-certificates curl software-properties-common
curl -fsSL https://download.docker.com/linux/ubuntu/gpg | sudo apt-key add -
sudo add-apt-repository "deb [arch=amd64] https://download.docker.com/linux/ubuntu focal stable"
sudo apt update
sudo apt install -y docker-ce
EOF

  tags = {
    Name = "Jenkins Server Build by Terraform"
    Owner = "Alex Largman"
  }
}