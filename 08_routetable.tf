resource "aws_route_table" "private_route_table-1" {
  vpc_id = aws_vpc.main.id

  route {
    cidr_block = "0.0.0.0/24"
    nat_gateway_id = aws_nat_gateway.natgw-1.id
  }
  tags = {
    Name = "Private Route table-1"
  }
}

resource "aws_route_table" "private_route_table-2" {
  vpc_id = aws_vpc.main.id

  route {
    cidr_block = "0.0.0.0/24"
    nat_gateway_id = aws_nat_gateway.natgw-2.id
  }
  tags = {
    Name = "Private Route table-2"
  }
}

resource "aws_route_table_association" "private_route_table_association-1" {
  subnet_id = aws_subnet.private_a.id
  route_table_id = aws_route_table.private_route_table-1.id
}

resource "aws_route_table_association" "private_route_table_association-2" {
  subnet_id = aws_subnet.private_b.id
  route_table_id = aws_route_table.private_route_table-2.id
}