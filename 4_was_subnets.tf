# CIDR 블록 변수 선언
variable "app-subnet1-cidr" {
  description = "CIDR block for the first application subnet"
  type        = string
  default     = "10.0.11.0/24"  # 예시 CIDR 블록
}

variable "app-subnet2-cidr" {
  description = "CIDR block for the second application subnet"
  type        = string
  default     = "10.0.21.0/24"  # 예시 CIDR 블록
}


# 첫 번째 애플리케이션 서브넷 (app-subnet1) 생성
resource "aws_subnet" "app-subnet1" {
  vpc_id                  = aws_vpc.vpc.id  
  cidr_block              = var.app-subnet1-cidr
  
  availability_zone       = "ap-northeast-2a" 
  map_public_ip_on_launch = false

  tags = {
    Name = "ce10-terraform-app_subnet1"
  }
}

# 두 번째 애플리케이션 서브넷 (app-subnet2) 생성
resource "aws_subnet" "app-subnet2" {
  vpc_id                  = aws_vpc.vpc.id  
  cidr_block              = var.app-subnet2-cidr  
  availability_zone       = "ap-northeast-2c"    
  map_public_ip_on_launch = false

  tags = {
    Name = "ce10-terraform-app_subnet2"
  }
}
