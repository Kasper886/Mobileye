resource "aws_instance" "web-server" {
  ami                    = var.ami_id
  instance_type          = var.instance_type
  subnet_id              = aws_vpc.test-vpc.id
  vpc_security_group_ids = [aws_security_group.web-servers.id]
  user_data              = <<EOF
#!/bin/bash
yum -y update
yum -y install httpd
myip=`curl http://169.254.169.254/latest/meta-data/local-ipv4`
echo "<h2>WebServer with IP: $myip</h2><br>Build by Terraform!"  >  /var/www/html/index.html
sudo service httpd start
chkconfig httpd on
EOF

  tags = {
    Name = "Jenkins Server Build by Terraform"
    Owner = "Alex Largman"
  }
}