resource "aws_vpc" "employee_vpc" {

  cidr_block = "10.0.0.0/16"

  tags = {
    Name = "employee-vpc"
  }
}

resource "aws_subnet" "public_subnet" {

  vpc_id = aws_vpc.employee_vpc.id

  cidr_block = "10.0.1.0/24"

  map_public_ip_on_launch = true

  tags = {
    Name = "employee-public-subnet"
  }
}

resource "aws_internet_gateway" "igw" {

  vpc_id = aws_vpc.employee_vpc.id

  tags = {
    Name = "employee-igw"
  }
}

resource "aws_route_table" "public_rt" {

  vpc_id = aws_vpc.employee_vpc.id

  tags = {
    Name = "employee-public-rt"
  }
}

resource "aws_route" "internet_access" {

  route_table_id = aws_route_table.public_rt.id

  destination_cidr_block = "0.0.0.0/0"

  gateway_id = aws_internet_gateway.igw.id
}

resource "aws_route_table_association" "public_assoc" {

  subnet_id = aws_subnet.public_subnet.id

  route_table_id = aws_route_table.public_rt.id
}
