# snachtech-infra-k8s
Criação de k8s EKS com terraform


### Tutorial de Implantação do Cluster Kubernetes com Terraform

Este tutorial mostra o passo a passo para criar um cluster Kubernetes na AWS e configurar os nós necessários para a aplicação.

---

### **1. Criar o Cluster e os Nós com o Terraform (`snacktech-infra-k8s`)**

#### **a) Inicializar o Terraform**
Inicie o Terraform no diretório do projeto para baixar os provedores e configurar o backend remoto, se necessário.

```bash
terraform init
```

#### **b) Validar a Configuração**
Verifique se há erros na configuração do Terraform.

```bash
terraform validate
```

#### **c) Gerar o Plano de Execução**
Antes de aplicar as mudanças, gere um plano detalhado para visualizar o que será criado ou modificado.

```bash
terraform plan -out=tfplan
```

#### **d) Visualizar o Plano de Execução**
Exiba o conteúdo do plano gerado.

```bash
terraform show tfplan
```

#### **e) Aplicar o Plano**
Provisione os recursos na AWS. Confirme a execução ou use a flag `-auto-approve` para pular a confirmação.

```bash
terraform apply tfplan
```

#### **f) Verificar a Criação do Cluster**
Após a execução do Terraform, verifique se o cluster foi criado corretamente com o comando:

```bash
aws eks describe-cluster --name snack-tech --region us-east-1
```

#### **g) Configurar o Acesso ao Cluster com `kubectl`**
Atualize a configuração do Kubernetes para acessar o cluster criado.

```bash
aws eks update-kubeconfig --name snack-tech --region us-east-1
```

#### **h) Verificar os Nós**
Verifique se os nós do cluster estão ativos.

```bash
kubectl get nodes