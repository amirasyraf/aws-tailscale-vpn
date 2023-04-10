resource "aws_security_group" "ec2_sg" {
  name        = "tailscale-vpn-ec2-sg"
  description = "EC2 Security Group"
  vpc_id      = aws_vpc.vpc.id

  egress {
    from_port        = 0
    to_port          = 0
    protocol         = "-1"
    cidr_blocks      = ["0.0.0.0/0"]
    ipv6_cidr_blocks = ["::/0"]
  }

  tags = {
    Name = "tailscale-vpn-ec2-sg"
  }
}