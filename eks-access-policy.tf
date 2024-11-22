resource "aws_eks_access_policy_association" "eks-policy" {
  cluster_name  = aws_eks_cluster.cluster-snack-tech.name
  policy_arn    = var.policyArn
  principal_arn = "arn:aws:iam::${var.accountIdVoclabs}:role/voclabs"

  access_scope {
    type = "cluster"
  }
}