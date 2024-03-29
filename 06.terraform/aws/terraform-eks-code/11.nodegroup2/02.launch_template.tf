resource "aws_launch_template" "node-template" {
  key_name               = var.key_name
  name                   = format("%s-%s-lt", var.cluster-name, var.node-group-name)
  tags                   = {}
  image_id               = data.aws_ssm_parameter.eks_ami.value
  user_data              = base64encode(local.eks-node-private-userdata)
  vpc_security_group_ids = data.aws_security_groups.allnodes-sg.ids
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
