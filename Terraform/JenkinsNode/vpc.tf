# network.tf

resource "aws_vpc" "test-vpc" {
  cidr_block = var.aws_vpc_cidr
  tags            = {
    Name          = "test-vpc"
  }
}

# Create public subnet
resource "aws_subnet" "public" {
  cidr_block              = "10.10.2.0/24"
  vpc_id                  = aws_vpc.test-vpc.id
  map_public_ip_on_launch = true

  tags = {
    Name = "PublicSubNet"
  }
}

# Internet Gateway for the public subnet
resource "aws_internet_gateway" "test-igw" {
  vpc_id = aws_vpc.test-vpc.id

   tags = {
     Name = "TestGW"
  }
}

# Route the public subnet traffic through the IGW
resource "aws_route" "internet_access" {
  route_table_id         = aws_vpc.test-vpc.main_route_table_id
  destination_cidr_block = "0.0.0.0/0"
  gateway_id             = aws_internet_gateway.test-igw.id
}

# Associate the public subnet traffic and close private subnets traffic
resource "aws_route_table_association" "public-a" {
    subnet_id      = aws_subnet.public.id
    route_table_id = aws_vpc.test-vpc.main_route_table_id
}