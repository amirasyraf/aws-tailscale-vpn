data "cloudinit_config" "user_data" {
  gzip          = false
  base64_encode = false

  part {
    filename     = "ec2.yaml"
    content_type = "text/cloud-config"

    # content = file("./cloud-init/ec2.yaml")
    content = templatefile("./cloud-init/ec2.tftpl", {
      auth_key = var.auth_key
    })
  }
}

resource "aws_instance" "ec2" {
  depends_on = [aws_iam_role.ssm_role]
  ami           = "ami-0406b8387ac37a82a" # Amazon Linux 2
  instance_type = "t4g.nano"
  associate_public_ip_address = true
  vpc_security_group_ids = [aws_security_group.ec2_sg.id]
  source_dest_check = true
  subnet_id = aws_subnet.subnet.id
  iam_instance_profile = aws_iam_instance_profile.ssm_instance_profile.id
  
  root_block_device {
    volume_type = "gp3"
    volume_size = "8"
    delete_on_termination = true
  }

  user_data_replace_on_change = true

  user_data = data.cloudinit_config.user_data.rendered

  tags = {
    Name = "tailscale-vpn-ec2"
  }
}