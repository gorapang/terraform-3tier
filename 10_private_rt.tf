# 프라이빗 라우트 테이블 생성
resource "aws_route_table" "private-route-table" {
  vpc_id = aws_vpc.vpc.id

  # 모든 트래픽을 NAT 게이트웨이를 통해 라우팅
  route {
    cidr_block = "0.0.0.0/0"     
    nat_gateway_id = aws_nat_gateway.nat-gw.id  # NAT 게이트웨이를 통해 라우팅
  }

  tags = {
    Name = "ce10-terraform-private-rt"  # 프라이빗 라우트 테이블 이름
  }
}

# 첫 번째 프라이빗 서브넷과 라우트 테이블 연결
resource "aws_route_table_association" "prv-rt-association-1" {
  subnet_id      = aws_subnet.app-subnet1.id
  route_table_id = aws_route_table.private-route-table.id
}

# 두 번째 프라이빗 서브넷과 라우트 테이블 연결
resource "aws_route_table_association" "prv-rt-association-2" {
  subnet_id      = aws_subnet.app-subnet2.id
  route_table_id = aws_route_table.private-route-table.id  # 오타 수정
}
