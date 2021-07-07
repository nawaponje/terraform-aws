##### List Instance #####
resource "aws_instance" "web-server" {
  ami                     = "ami-0d058fe428540cd89"
  instance_type           = "t2.micro"
  key_name                = "nawapon-aws-key"
  vpc_security_group_ids  = [aws_security_group.sec_group_default.id,aws_security_group.sec_group_web.id]
  user_data               = <<EOF
#!/bin/bash
apt update -y
apt install -y apache2
systemctl start apache2
EOF
  tags = {
    Name  = "Web-Server"
    Owner = "NawaponJe-Owner"
  }
}