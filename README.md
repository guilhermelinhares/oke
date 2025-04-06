# 🚀 Kubernetes Cluster on Oracle Cloud (OCI)  
# 🚀 Cluster Kubernetes na Oracle Cloud (OCI)

This project aims to provision a Kubernetes cluster on Oracle Cloud Infrastructure (OCI) using modern, open-source tools.  
Este projeto tem como objetivo provisionar um cluster Kubernetes na Oracle Cloud Infrastructure (OCI), utilizando ferramentas modernas e open source.

---

## 🔧 Prerequisites / Pré-requisitos

Before getting started, you'll need to create an Oracle Cloud account and install some essential tools.  
Antes de começar, é necessário criar uma conta na Oracle Cloud e instalar algumas ferramentas essenciais.

### ✅ Create an Oracle Cloud Account  
### ✅ Criar Conta na Oracle Cloud

Sign up for a free account at: [signup.cloud.oracle.com](https://signup.cloud.oracle.com/)  
Crie uma nova conta gratuita em: [signup.cloud.oracle.com](https://signup.cloud.oracle.com/)

---

## 📦 Required Binaries / Binaries necessários

Make sure the following tools are installed on your local environment:  
As ferramentas abaixo devem estar instaladas no seu ambiente local:

### 🧱 [OpenTofu](https://opentofu.org/)

Infrastructure as code tool (open-source fork of Terraform).  
Ferramenta de infraestrutura como código (fork open source do Terraform).

**Quick install / Instalação rápida:**

```bash
curl -fsSL https://get.opentofu.org/install.sh | bash
```

### ☸️ [Kubectl](https://kubernetes.io/docs/tasks/tools/)

Official CLI to interact with Kubernetes clusters.
CLI oficial para interagir com clusters Kubernetes.

**Quick install / Instalação rápida:**

```bash
curl -LO "https://dl.k8s.io/release/$(curl -s https://dl.k8s.io/release/stable.txt)/bin/linux/amd64/kubectl"
chmod +x kubectl
sudo mv kubectl /usr/local/bin/
```

### 🛠️ [OCI CLI](https://docs.oracle.com/en-us/iaas/Content/API/SDKDocs/cliinstall.htm)

Command-line interface to interact with Oracle Cloud resources.
Interface de linha de comando para interagir com recursos da Oracle Cloud.

**Quick install / Instalação rápida:**

```bash
bash -c "$(curl -L https://raw.githubusercontent.com/oracle/oci-cli/master/scripts/install/install.sh)"
```
After installation, configure with:
Após a instalação, configure com:

```bash
oci setup config
```
You’ll need your tenancy OCID, user OCID, compartment OCID, and an API key.
Você vai precisar do seu tenancy OCID, user OCID, compartment OCID e uma API key.

**Check version / Verificar versão:**
```bash
oci --version
```

✅ Obs OCI:

🔐 You must generate an API key to access Oracle Cloud programmatically.
🔐 Você deve gerar uma chave de API para acessar a Oracle Cloud de forma programática.

Go to: https://cloud.oracle.com/identity/domains/my-profile/api-keys

---

## ▶️ How to Use the Environment Script  
## ▶️ Como Usar o Script de Ambiente

To simplify the process, you can use the `env.sh` script to export all required environment variables.  
Para simplificar o processo, você pode usar o script `env.sh` para exportar todas as variáveis de ambiente necessárias.

### 📄 Create the script / Crie o script:

Create a file named `env.sh` with the following content:  
Crie um arquivo chamado `env.sh` com o seguinte conteúdo:

```bash
#!/bin/sh

# === OCI Configuration ===
export TF_VAR_tenancy_ocid="<your-tenancy-ocid>"
export TF_VAR_user_ocid="<your-user-ocid>"
export TF_VAR_fingerprint="<your-api-key-fingerprint>"
export TF_VAR_private_key_path="$HOME/.oci/oci_api_key.pem"

# === SSH Public Key ===
export TF_VAR_ssh_public_key=$(cat ssh/id_rsa.pub)

# === OCI Profile (Optional) ===
export TF_VAR_oci_profile="DEFAULT"

echo "[✓] Environment variables exported successfully!"
```

▶️ Make it executable / Torne-o executável:

```bash
chmod +x env.sh
```

▶️ Run the script / Execute o script:

```bash
source ./env.sh
```