##### List Instance #####

####-- instance web-1 zone-a --####
resource "aws_instance" "web-1" {
  ami                     = "ami-0d058fe428540cd89"
  instance_type           = "t2.micro"
  key_name                = "nawapon-aws-key"
  subnet_id               = aws_subnet.private_a.id
  vpc_security_group_ids  = [aws_security_group.sec_group_default.id,aws_security_group.sec_group_web.id]
  associate_public_ip_address = true
  user_data               = <<EOF
#!/bin/bash
sudo apt update -y
sudo apt install -y nginx
sudo sed -i 's/Welcome to nginx/Welcome to Web-1/g' /var/www/html/index.nginx-debian.html
sudo systemctl restart nginx
EOF
  tags = {
    Name  = "Web-1"
    Owner = "NawaponJe-Owner"
  }
}

####-- instance web-2 zone-b --####
resource "aws_instance" "web-2" {
  ami                     = "ami-0d058fe428540cd89"
  instance_type           = "t2.micro"
  key_name                = "nawapon-aws-key"
  subnet_id               = aws_subnet.private_b.id
  vpc_security_group_ids  = [aws_security_group.sec_group_default.id,aws_security_group.sec_group_web.id]
  associate_public_ip_address = true
  user_data               = <<EOF
#!/bin/bash
sudo apt update -y
sudo apt install -y nginx
sudo sed -i 's/Welcome to nginx/Welcome to Web-2/g' /var/www/html/index.nginx-debian.html
sudo systemctl restart nginx
EOF
  tags = {
    Name  = "Web-2"
    Owner = "NawaponJe-Owner"
  }
}