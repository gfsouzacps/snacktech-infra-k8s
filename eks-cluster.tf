# Primeiro, tenta encontrar o Security Group existente
data "aws_security_group" "existing_sg" {
  filter {
    name   = "group-name"
    values = ["SG-snack-tech"]
  }
  vpc_id = data.aws_vpc.vpc.id 
}

# Se não encontrar, cria um novo Security Group
resource "aws_security_group" "sg" {
  count        = length(data.aws_security_group.existing_sg.id) == 0 ? 1 : 0  # Cria apenas se não existir
  name         = "SG-snack-tech"
  description  = "Security group for snack-tech"
  vpc_id       = data.aws_vpc.vpc.id
}

resource "aws_eks_cluster" "cluster-snack-tech" {
  name     = var.projectName
  role_arn = data.aws_iam_role.labrole.arn

  vpc_config {
    subnet_ids         = [for subnet in data.aws_subnet.subnet : subnet.id if subnet.availability_zone != "${var.regionDefault}e"]
    security_group_ids = [data.aws_security_group.existing_sg.id != "" ? data.aws_security_group.existing_sg.id : aws_security_group.sg.id]
  }

  access_config {
    authentication_mode = var.accessConfig
  }
}
