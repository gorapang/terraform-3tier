# 인터넷 게이트웨이 생성
resource "aws_internet_gateway" "internet-gw" {
  # 이 인터넷 게이트웨이가 연결될 VPC의 ID. aws_vpc 리소스에서 생성된 VPC를 참조.
  vpc_id = aws_vpc.vpc.id

  # 인터넷 게이트웨이의 태그. AWS 콘솔에서 식별을 쉽게 하기 위해 Name 태그 설정.
  tags = {
    Name = "ce10-terraform-igw"  # 인터넷 게이트웨이 이름
  }
}
