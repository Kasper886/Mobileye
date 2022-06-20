# WebServer Security Group:
resource "aws_security_group" "web-servers" {
  name        = "WebServer Security Group"
  description = "Dynamic Web Security Group"
  vpc_id      = aws_vpc.test-vpc.id

  dynamic ingress {
    for_each = ["80", "443", "21", "22"]
    content {
      from_port   = ingress.value
      to_port     = ingress.value
      protocol    = "tcp"
      #cidr_blocks = ["${aws_vpc.test-vpc.cidr_block}"]
      cidr_blocks = ["0.0.0.0/0"]
    }
  }

  ingress {
    from_port   = -1
    to_port     = -1
    protocol    = "icmp"
    #cidr_blocks = ["${aws_vpc.test-vpc.cidr_block}"]
    cidr_blocks = ["0.0.0.0/0"]
  }

  egress {
    from_port   = 0
    to_port     = 0
    protocol    = "-1"
    cidr_blocks = ["0.0.0.0/0"]
  }

  tags = {
    Name  = "Web-SG"
    Owner = "Alex Largman"
  }
}