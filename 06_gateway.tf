##### VPC Internet Gateway #####
resource "aws_internet_gateway" "internet-gw" {
  vpc_id = aws_vpc.main.id
  tags = {
    Name = "internet-gw"
  }
}

####-- nat gateway for zone-a --####
resource "aws_nat_gateway" "natgw-1" {
  connectivity_type = "public"
  allocation_id     = aws_eip.eip-natgw-1.id
  subnet_id         = aws_subnet.public_a.id
  tags    = {
    Name  = "natgw-1"
  }
}

####-- nat gateway for zone-b --####
resource "aws_nat_gateway" "natgw-2" {
  connectivity_type = "public"
  allocation_id     = aws_eip.eip-natgw-2.id
  subnet_id         = aws_subnet.public_b.id
  tags    = {
    Name  = "natgw-2"
  }
}