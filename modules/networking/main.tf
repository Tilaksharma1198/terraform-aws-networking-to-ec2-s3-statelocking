resource "aws_internet_gateway" "igw" {
  vpc_id = var.vpc_id

  tags = {
    Name = var.igw_name
  }
}

resource "aws_subnet" "public" {
  vpc_id                  = var.vpc_id
  cidr_block              = var.subnet_cidr
  map_public_ip_on_launch = true

  tags = {
    Name = var.subnet_name
  }
}

resource "aws_route_table" "public" {
  vpc_id = var.vpc_id

  route {
    cidr_block = "0.0.0.0/0"
    gateway_id = aws_internet_gateway.igw.id
  }

  tags = {
    Name = var.rt_name
  }
}

resource "aws_route_table_association" "a" {
  subnet_id      = aws_subnet.public.id
  route_table_id = aws_route_table.public.id
}
