module "eks" {
  source  = "terraform-aws-modules/eks/aws"
  version = "21.0.0"

  eks_cluster = {
    name                   = var.cluster_name
    version                = "1.24"
    endpoint_public_access = true
  }

  vpc_id     = module.vpc.vpc_id
  subnet_ids = module.vpc.public_subnets

  eks_managed_node_groups = {
    alura = {
      min_size     = 1
      max_size     = 10
      desired_size = 3
      vpc_security_group_ids = [aws_security_group.ssh_cluster.id]
      instance_types = ["t2.micro"]
    }
  }
}
