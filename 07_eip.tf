##### Elastic IP #####

####-- eip for nat gateway zone-a --####
resource "aws_eip" "eip-natgw-1" {
  depends_on = [aws_internet_gateway.internet-gw]
  tags  = {
    Name = "eip-natgw-1"
  }
}

####-- eip for nat gateway zone-b --####
resource "aws_eip" "eip-natgw-2" {
  depends_on = [aws_internet_gateway.internet-gw]
  tags  = {
    Name = "eip-natgw-2"
  }
}