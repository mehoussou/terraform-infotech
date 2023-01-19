module "eks" {
  source = "terraform-aws-modules/eks/aws"
  version = "~> 18.0"

  cluster_name = "infotech-eks-cluster"
  cluster_version = "1.22"

  subnet_ids = module.infotech-vpc.private_subnets
  vpc_id= module.infotech-vpc.vpc_id
  tags = {
    environment = "deployment"
    application = "infotech"
  }

  eks_managed_node_groups = {
    dev = {
        min_size = 1
        max_size = 3
        desired_size = 3

        instance_types = ["t2.micro"]
    }
  }
   
}