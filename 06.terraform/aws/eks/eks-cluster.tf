module "eks" {
  source          = "terraform-aws-modules/eks/aws"
  version         = "~> 18.0"
  cluster_name    = var.cluster_name
  cluster_version = var.cluster_version
  subnet_ids      = module.vpc.private_subnets
  vpc_id          = module.vpc.vpc_id

  cluster_endpoint_private_access = true
  cluster_endpoint_public_access  = true
  
  cluster_tags = {
    Name = var.cluster_name
    Env  = var.environment
  }
  
  cluster_addons = {
    coredns = {
      resolve_conflicts = "OVERWRITE"
    }
    kube-proxy = {}
    vpc-cni = {
      resolve_conflicts = "OVERWRITE"
    }
  }
  
#   cluster_encryption_config = [{
#     provider_key_arn = aws_kms_key.eks.arn
#     resources        = ["secrets"]
#   }]
#   create_kms_key = true

  cluster_security_group_id = aws_security_group.eks-default.id
  cluster_additional_security_group_ids = [ aws_security_group.eks-remote-access.id, aws_security_group.eks-cluster.id]
  
  node_security_group_id = aws_security_group.eks-node.id

  create_iam_role = false
  iam_role_arn = aws_iam_role.eks-cluster.arn

  eks_managed_node_group_defaults = {
    disk_size                = 10
    instance_types           = var.ec2_instance_types
    vpc_security_group_ids   = [aws_security_group.eks-node.id]
    create_iam_role          = false
    iam_role_arn             = aws_iam_role.eks-node.arn
    iam_role_use_name_prefix = false
  }

  eks_managed_node_groups = {
    # default_node_group_one = {
    #     create_launch_template = false
    #     launch_template_name   = ""
    #     min_size     = 1
    #     max_size     = 10
    #     desired_size = 1
    #     instance_types = var.ec2_instance_types
    # }

    # blue = {
    #     create_launch_template = false
    #     launch_template_name   = ""
    #     min_size     = 1
    #     max_size     = 10
    #     desired_size = 2
    #     instance_types = var.ec2_instance_types
    #     remote_access = {
    #         ec2_ssh_key               = aws_key_pair.this.key_name
    #         source_security_group_ids = [aws_security_group.eks-remote-access.id]
    #     }
    # }

    default_node_group = {
        create_launch_template = false
        launch_template_name   = ""
        min_size     = 2
        max_size     = 10
        desired_size = 2
        instance_types = var.ec2_instance_types
        remote_access = {
            ec2_ssh_key               = aws_key_pair.this.key_name
            source_security_group_ids = [aws_security_group.eks-remote-access.id]
        }
    }
  }
}

resource "aws_kms_key" "eks" {
  description             = "EKS Secret Encryption Key"
  deletion_window_in_days = 7
  enable_key_rotation     = true

  tags = {
    Name = var.cluster_name
    Env  = var.environment
  }
}

resource "tls_private_key" "this" {
  algorithm = "RSA"
}

resource "aws_key_pair" "this" {
  key_name_prefix = var.cluster_name
  public_key      = tls_private_key.this.public_key_openssh

  tags = {
    Name = var.cluster_name
    Env  = var.environment
  }
}

data "aws_eks_cluster" "cluster" {
  name = module.eks.cluster_id
}

data "aws_eks_cluster_auth" "cluster" {
  name = module.eks.cluster_id
}
