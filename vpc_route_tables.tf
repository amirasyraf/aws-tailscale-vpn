resource "aws_route_table" "rtb_public" {
  vpc_id = aws_vpc.vpc.id

  route {
    cidr_block = "0.0.0.0/0"
    gateway_id = aws_internet_gateway.igw.id
  }

  tags = {
    Name = "tailscale-vpn-rtb-public"
  }
}

resource "aws_route_table_association" "rtb_public_association" {
  subnet_id      = aws_subnet.subnet.id
  route_table_id = aws_route_table.rtb_public.id
}