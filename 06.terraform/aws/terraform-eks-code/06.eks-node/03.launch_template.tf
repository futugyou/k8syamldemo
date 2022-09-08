resource "aws_launch_template" "node-template" {
  instance_type          = "m5a.large"
  key_name               = aws_key_pair.eksworkshop.key_name
  name                   = format("%s-%s-lt", var.cluster-name, var.node-group-name)
  tags                   = {}
  image_id               = data.aws_ssm_parameter.eks_ami.value
  user_data              = base64encode(local.eks-node-private-userdata)
  vpc_security_group_ids = [data.aws_security_groups.allnodes-sg.id]
  tag_specifications {
    resource_type = "instance"
    tags = {
      Name = format("%s-%s-lt", var.cluster-name, var.node-group-name)
    }
  }
  lifecycle {
    create_before_destroy = true
  }
}
