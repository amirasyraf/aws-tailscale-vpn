resource "aws_subnet" "subnet" {
  vpc_id     = aws_vpc.vpc.id
  cidr_block = "10.0.0.0/20"

  availability_zone = "${var.region}a"
  map_public_ip_on_launch = true

  tags = {
    Name = "tailscale-vpn-subnet-public-${var.region}a"
  }
}