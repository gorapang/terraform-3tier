# ALB 생성
resource "aws_lb" "ce10-external-alb" {
  name               = "ce10-external-alb"
  internal           = false  # 퍼블릭 ALB
  load_balancer_type = "application"
  security_groups    = [aws_security_group.ce10-webalb-sg.id]
  subnets            = [aws_subnet.web-subnet1.id, aws_subnet.web-subnet2.id]

  tags = {
    Name = "ce10-external-alb"
  }
}

# ALB 리스너 생성 (HTTP)
resource "aws_lb_listener" "ce10-alb-listener" {
  load_balancer_arn = aws_lb.ce10-external-alb.arn
  port              = 80
  protocol          = "HTTP"

  default_action {
    type             = "forward"
    target_group_arn = aws_lb_target_group.ce10-web-tg.arn
  }
}
