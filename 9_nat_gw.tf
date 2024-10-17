# NAT 게이트웨이 생성
resource "aws_nat_gateway" "nat-gw" {
  # NAT 게이트웨이에 연결할 Elastic IP의 ID. aws_eip 리소스에서 생성된 EIP를 참조.
  allocation_id     = aws_eip.eip.id
  
  # NAT 게이트웨이의 연결 유형. public으로 설정하여 퍼블릭 NAT 게이트웨이로 만듦.
  connectivity_type = "public"
  
  # NAT 게이트웨이가 속할 서브넷의 ID. aws_subnet 리소스에서 생성된 서브넷을 참조.
  subnet_id         = aws_subnet.web-subnet1.id
  
  # NAT 게이트웨이의 태그. AWS 콘솔에서 식별을 쉽게 하기 위해 Name 태그 설정.
  tags = {
    Name = "ce10-terraform-ngw"  # NAT 게이트웨이의 이름
  }

  # 이 NAT 게이트웨이는 인터넷 게이트웨이에 의존하므로 depends_on 사용.
  depends_on = [aws_internet_gateway.internet-gw]
}
      