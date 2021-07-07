resource "aws_nat_gateway" "natgw-1" {
  connectivity_type = "public"
  allocation_id     = aws_eip.eip-natgw-1.id
  subnet_id         = aws_subnet.public_a.id
  tags    = {
    Name  = "natgw-1"
  }
}

resource "aws_nat_gateway" "natgw-2" {
  connectivity_type = "public"
  allocation_id     = aws_eip.eip-natgw-2.id
  subnet_id         = aws_subnet.public_b.id
  tags    = {
    Name  = "natgw-2"
  }
}