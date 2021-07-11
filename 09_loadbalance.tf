##### main application loadbalancer #####
resource "aws_lb" "web_app_lb" {
  name                       = "webapp-lb"
  internal                   = false
  load_balancer_type         = "application"
  security_groups            = [aws_security_group.sec_group_default.id,aws_security_group.sec_group_web.id]
  subnets                    = [aws_subnet.public_a.id,aws_subnet.public_b.id]
  enable_deletion_protection = true
  tags = {
    Name = "web_app_lb"
  }
}

##### loadbalance outbound to instance #####
resource "aws_lb_target_group" "lb-outbound" {
  name     = "lb-outbound"
  port     = "80"
  protocol = "HTTP"
  vpc_id   = aws_vpc.main.id
}

####--for zone a--####
resource "aws_lb_target_group_attachment" "zone-a" {
  target_group_arn = aws_lb_target_group.lb-outbound.arn
  target_id        = aws_instance.web-1.id
}

####--for zone b--####
resource "aws_lb_target_group_attachment" "zone-b" {
  target_group_arn = aws_lb_target_group.lb-outbound.arn
  target_id        = aws_instance.web-2.id
}

##### loadbalance inbound from internet
resource "aws_lb_listener" "lb-inbound" {
  load_balancer_arn = aws_lb.web_app_lb.arn
  port                  = "80"
  protocol              = "HTTP"

  default_action {
    type             = "forward"
    target_group_arn = aws_lb_target_group.lb-outbound.arn
  }
}