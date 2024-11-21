resource "aws_iam_role" "alb_controller" {
  name               = "ALBIngressControllerRole"
  assume_role_policy = data.aws_iam_policy_document.alb_policy.json
}

resource "aws_iam_policy" "alb_policy" {
  name        = "AWSLoadBalancerControllerPolicy"
  policy      = data.aws_iam_policy_document.alb_policy.json
}

module "alb_ingress" {
  source                  = "terraform-aws-modules/eks/aws"
  cluster_name            = module.eks.cluster_name
  oidc_provider_enabled   = true
  aws_load_balancer_controller = true
}
