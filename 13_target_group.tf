# 타겟 그룹 생성
resource "aws_lb_target_group" "ce10-web-tg" {
  name     = "ce10-web-tg"
  port     = 80
  protocol = "HTTP"
  vpc_id   = aws_vpc.vpc.id

  health_check {
    path                = "/"
    interval            = 30
    timeout             = 5
    healthy_threshold   = 5
    unhealthy_threshold = 2
    matcher             = "200"
  }

  tags = {
    Name = "ce10-web-tg"
  }
}

# 타겟 그룹에 첫 번째 인스턴스 추가
resource "aws_lb_target_group_attachment" "ce10-webserver1-attachment" {
  target_group_arn = aws_lb_target_group.ce10-web-tg.arn
  target_id        = aws_instance.ce10-webserver1.id
  port             = 80
}

# 타겟 그룹에 두 번째 인스턴스 추가
resource "aws_lb_target_group_attachment" "ce10-webserver2-attachment" {
  target_group_arn = aws_lb_target_group.ce10-web-tg.arn
  target_id        = aws_instance.ce10-webserver2.id
  port             = 80
}
