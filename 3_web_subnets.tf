# 첫 번째 서브넷의 CIDR 블록 변수 선언
variable "web-subnet1-cidr" {
  description = "첫 번째 서브넷의 CIDR 블록"
  type        = string
  default     = "10.0.1.0/24" # 서브넷1의 기본 CIDR 블록
}

# 두 번째 서브넷의 CIDR 블록 변수 선언
variable "web-subnet2-cidr" {
  description = "두 번째 서브넷의 CIDR 블록"
  type        = string
  default     = "10.0.2.0/24" # 서브넷2의 기본 CIDR 블록
}



# 첫 번째 서브넷 (web-subnet1) 생성
resource "aws_subnet" "web-subnet1" {
  # 이 서브넷이 속할 VPC의 ID. aws_vpc 리소스에서 생성된 VPC를 참조.
  vpc_id = aws_vpc.vpc.id
  
  # 서브넷의 CIDR 블록. var.web-subnet1-cidr 변수를 사용해 IP 범위 설정.
  cidr_block = var.web-subnet1-cidr
  
  # 이 서브넷이 위치할 가용 영역 (서울 리전 - ap-northeast-2a).
  availability_zone = "ap-northeast-2a"
  
  # 인스턴스가 이 서브넷에 생성될 때 자동으로 퍼블릭 IP 할당 여부. true로 설정.
  map_public_ip_on_launch = true

  # 서브넷의 태그. AWS 콘솔에서 식별을 쉽게 하기 위해 Name 태그 설정.
  tags = {
    Name = "ce10-terraform-subnet1"
  }
}

# 두 번째 서브넷 (web-subnet2) 생성
resource "aws_subnet" "web-subnet2" {
  vpc_id = aws_vpc.vpc.id
  cidr_block = var.web-subnet2-cidr
  availability_zone = "ap-northeast-2c"
  map_public_ip_on_launch = true
  
  tags = {
    Name = "ce10-terraform-subnet2"
  }
}
