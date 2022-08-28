resource "aws_eip" "eip-terraform" {
  public_ipv4_pool = "amazon"
  tags = {
    Name = var.eip_name
  }
  vpc = true
  timeouts {}
}
