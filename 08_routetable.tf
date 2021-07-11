##### Private subnet Route-table #####

####-- route table zone-a --####
resource "aws_route_table" "private_route_table-a" {
  vpc_id = aws_vpc.main.id

  route {
    cidr_block     = "0.0.0.0/24"
    nat_gateway_id = aws_nat_gateway.natgw-1.id
  }
  tags = {
    Name = "Private Route table-a"
  }
}
resource "aws_route_table_association" "private_route_table_association-1" {
  subnet_id      = aws_subnet.private_a.id
  route_table_id = aws_route_table.private_route_table-a.id
}


####-- route table zone-b --####
resource "aws_route_table" "private_route_table-b" {
  vpc_id = aws_vpc.main.id

  route {
    cidr_block     = "0.0.0.0/24"
    nat_gateway_id = aws_nat_gateway.natgw-2.id
  }
  tags = {
    Name = "Private Route table-b"
  }
}

resource "aws_route_table_association" "private_route_table_association-2" {
  subnet_id      = aws_subnet.private_b.id
  route_table_id = aws_route_table.private_route_table-b.id
}

####-- Public route table zone-a --####
resource "aws_route_table" "public_route_table-a" {
  vpc_id = aws_vpc.main.id
  route {
    cidr_block = "0.0.0.0/24"
    gateway_id = aws_internet_gateway.internet-gw.id
  }
  tags = {
    Name = "Public Route table-a"
  }
}

resource "aws_route_table_association" "public_route_table_association-a" {
  subnet_id      = aws_subnet.public_a.id
  route_table_id = aws_route_table.public_route_table-a.id
}

####-- Public route table zone-b --####
resource "aws_route_table" "public_route_table-b" {
  vpc_id = aws_vpc.main.id
  route {
    cidr_block = "0.0.0.0/24"
    gateway_id = aws_internet_gateway.internet-gw.id
  }
  tags = {
    Name = "Public Route table-b"
  }
}

resource "aws_route_table_association" "public_route_table_association-b" {
  subnet_id      = aws_subnet.public_b.id
  route_table_id = aws_route_table.public_route_table-b.id
}