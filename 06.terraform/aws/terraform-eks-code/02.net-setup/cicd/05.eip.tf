// elastic ip
resource "aws_eip" "cicd-eipalloc" {
  public_ipv4_pool = "amazon"
  tags = {
    "Name" = format("%s-eip", var.cicd-vpc-name)
  }
  vpc = true

  timeouts {}
}
