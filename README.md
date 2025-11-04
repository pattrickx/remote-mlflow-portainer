# MLflow Remote Server with Docker Compose

Deploy a complete MLflow tracking server with MinIO (S3-compatible storage) and MySQL backend.

## Services Included

- **MLflow**: Experiment tracking (Port 5001)
- **MinIO**: Object storage for artifacts (Ports 9002, 9003)
- **MySQL**: Backend store for MLflow (Port 3306)
- **Adminer**: Database management UI (Port 8080)

## Default Credentials

### MinIO
- **Console URL**: http://your-server:9003
- **Admin**: ROOTNAME / CHANGEME123
- **MLflow User**: MLFlowUser / MyFlowPass

### MySQL
- **Adminer URL**: http://your-server:8080
- **Database**: mlflow_db
- **User**: mlflow_user
- **Password**: mlflow_password

### MLflow
- **URL**: http://your-server:5001

## Deployment with Portainer

1. In Portainer, go to **Stacks**
2. Click **Add stack**
3. Choose **Repository** method
4. Fill in:
   - **Name**: mlflow-stack
   - **Repository URL**: https://github.com/yourusername/remote-mlflow-portainer
   - **Compose path**: docker-compose.yml
5. Click **Deploy the stack**

## URLs de Acesso Após Deploy

- **MLflow UI**: http://seu-ip:5001
- **MinIO Console**: http://seu-ip:9003
- **Adminer (MySQL)**: http://seu-ip:8080

## Melhorias Incluídas

- Health checks no MySQL para garantir inicialização ordenada
- Restart policies com unless-stopped
- Volumes nomeados para persistência de dados
- Comando melhorado no MLflow com delay para dependências
- Script mais robusto para setup do MinIO

## Como Usar

1. Clone este repositório
2. Configure as credenciais nos arquivos conforme necessário
3. Execute com `docker-compose up -d` ou use no Portainer
4. Acesse os serviços pelas URLs mencionadas acima

## Configuração no Portainer

No Portainer, ao criar a stack:

- **Nome**: mlflow-stack (ou o nome que preferir)
- **Método**: Repository
- **Repository URL**: https://github.com/seu-usuario/remote-mlflow-portainer
- **Compose path**: docker-compose.yml (deixe como padrão)
- **Branch**: main (ou a branch que estiver usando)