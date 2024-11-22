resource "aws_eks_access_entry" "access-entry" {
  cluster_name      = aws_eks_cluster.cluster-snack-tech.name
  principal_arn     = "arn:aws:iam::${var.accountIdVoclabs}:role/voclabs"
  kubernetes_groups = ["fiap", "live"]
  type              = "STANDARD"
}