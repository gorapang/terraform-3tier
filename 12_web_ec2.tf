# 첫 번째 EC2 인스턴스 (ce10-webserver1)
resource "aws_instance" "ce10-webserver1" {
  ami           = "ami-040c33c6a51fd5d96"  # Ubuntu AMI 예시
  instance_type = "t2.micro"
  subnet_id     = aws_subnet.web-subnet1.id
  security_groups = [aws_security_group.ce10-webalb-sg.id]

  # 키페어 지정
  key_name = "ce10-key"

  # user_data 속성에 스크립트 작성
  user_data = <<-EOF
    #!/bin/bash
    sudo apt-get update -y
    sudo apt-get upgrade -y
    sudo apt-get install nginx -y
  EOF

  tags = {
    Name = "ce10-webserver1"
  }
}

# 두 번째 EC2 인스턴스 (ce10-webserver2)
resource "aws_instance" "ce10-webserver2" {
  ami           = "ami-040c33c6a51fd5d96"  # Ubuntu AMI 예시
  instance_type = "t2.micro"
  subnet_id     = aws_subnet.web-subnet2.id
  security_groups = [aws_security_group.ce10-webalb-sg.id]

  # 키페어 지정
  key_name = "ce10-key"

  # 동일한 스크립트 작성
  user_data = <<-EOF
    #!/bin/bash
    sudo apt-get update -y
    sudo apt-get upgrade -y
    sudo apt-get install nginx -y
  EOF

  tags = {
    Name = "ce10-webserver2"
  }
}
