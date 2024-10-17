# 퍼블릭 라우트 테이블 생성
resource "aws_route_table" "public-route-table" {
  # 라우트 테이블이 속할 VPC의 ID. aws_vpc 리소스에서 생성된 VPC를 참조.
  vpc_id = aws_vpc.vpc.id

  # 기본 라우트 설정. 모든 트래픽을 인터넷 게이트웨이로 라우팅.
  route {
    cidr_block = "0.0.0.0/0"  # 모든 IP 주소에 대한 트래픽
    gateway_id = aws_internet_gateway.internet-gw.id  # 인터넷 게이트웨이를 통해 라우팅
  }

  # 라우트 테이블의 태그. AWS 콘솔에서 식별을 쉽게 하기 위해 Name 태그 설정.
  tags = {
    Name = "ce10-terraform-public-rt"  # 퍼블릭 라우트 테이블의 이름
  }
}

# 첫 번째 퍼블릭 라우트 테이블과 서브넷의 연결
resource "aws_route_table_association" "pub-rt-association-1" {
  # 연결할 서브넷의 ID. aws_subnet 리소스에서 생성된 서브넷을 참조.
  subnet_id      = aws_subnet.web-subnet1.id
  
  # 연결할 라우트 테이블의 ID. aws_route_table 리소스에서 생성된 라우트 테이블을 참조.
  route_table_id = aws_route_table.public-route-table.id
}

# 두 번째 퍼블릭 라우트 테이블과 서브넷의 연결
resource "aws_route_table_association" "pub-rt-association-2" {
  subnet_id      = aws_subnet.web-subnet2.id
  route_table_id = aws_route_table.public-route-table.id
}
