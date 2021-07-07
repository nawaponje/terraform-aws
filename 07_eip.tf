resource "aws_eip" "eip-natgw-1" {
  vpc   = true
  tags  = {
    Name = "eip-natgw-1"
  }
}

resource "aws_eip" "eip-natgw-2" {
  vpc   = true  
  tags  = {
    Name = "eip-natgw-2"
  }
}