module "eks" {
  source          = "terraform-aws-modules/eks/aws"
  version         = "~> 18.0"
  cluster_name    = var.cluster_name
  cluster_version = var.cluster_version
  subnet_ids      = module.vpc.private_subnets
  vpc_id          = module.vpc.vpc_id
  
  cluster_tags = {
    Name = var.cluster_name
    Env  = var.environment
  }
  
  create_kms_key = true

  cluster_security_group_id = aws_security_group.eks-default.id
  cluster_additional_security_group_ids = [ aws_security_group.eks-sg-22.id, aws_security_group.eks-cluster.id]
  
  node_security_group_id = aws_security_group.eks-node.id

  create_iam_role = false
  iam_role_arn = aws_iam_role.eks-cluster.arn

  eks_managed_node_group_defaults = {
    disk_size              = 10
    instance_types         = var.ec2_instance_types
    vpc_security_group_ids = [aws_security_group.eks-node.id]
    create_iam_role        = false
    iam_role_arn           = aws_iam_role.eks-node.arn
  }

  eks_managed_node_groups = {
    blue = {}
    green = {
      min_size     = 1
      max_size     = 10
      desired_size = 1
      instance_types = var.ec2_instance_types
    }
  }

}

data "aws_eks_cluster" "cluster" {
  name = module.eks.cluster_id
}

data "aws_eks_cluster_auth" "cluster" {
  name = module.eks.cluster_id
}
