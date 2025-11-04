FROM python:3.9-slim

# Instalar dependências do sistema necessárias
RUN apt-get update && apt-get install -y \
    gcc \
    g++ \
    default-libmysqlclient-dev \
    pkg-config \
    curl \
    && rm -rf /var/lib/apt/lists/*

# Criar diretório de trabalho
RUN mkdir -p /mlflow
WORKDIR /mlflow

# Instalar dependências Python
RUN pip install --no-cache-dir --upgrade pip

# Instalar pacotes específicos com versões compatíveis
RUN pip install --no-cache-dir \
    mlflow==2.11.3 \
    boto3==1.34.0 \
    pymysql==1.1.0 \
    cryptography==41.0.8 \
    mysql-connector-python==8.1.0 \
    scikit-learn==1.3.2 \
    pandas==2.1.3 \
    numpy==1.25.2

# Criar usuário não-root para segurança
RUN groupadd -r mlflowuser && useradd -r -g mlflowuser mlflowuser
RUN chown -R mlflowuser:mlflowuser /mlflow
USER mlflowuser

# Health check para verificar se o serviço está rodando
HEALTHCHECK --interval=30s --timeout=30s --start-period=5s --retries=3 \
    CMD curl -f http://localhost:5000/ || exit 1

EXPOSE 5000

# Comando para rodar o MLflow server ouvindo em todas as interfaces
CMD ["mlflow", "server", "--host", "0.0.0.0", "--port", "5000"]
