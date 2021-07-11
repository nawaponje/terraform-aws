##### Elastic IP #####

####-- eip for nat gateway zone-a --####
resource "aws_eip" "eip-natgw-1" {
  vpc   = true
  tags  = {
    Name = "eip-natgw-1"
  }
}

####-- eip for nat gateway zone-b --####
resource "aws_eip" "eip-natgw-2" {
  vpc   = true  
  tags  = {
    Name = "eip-natgw-2"
  }
}