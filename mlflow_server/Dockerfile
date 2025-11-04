FROM python:3.9-slim

# Instalar apenas dependências essenciais
RUN apt-get update && apt-get install -y \
    curl \
    && rm -rf /var/lib/apt/lists/*

# Criar diretório de trabalho
WORKDIR /app

# Instalar dependências Python otimizadas
RUN pip install --no-cache-dir --upgrade pip && \
    pip install --no-cache-dir \
    mlflow==2.11.3 \
    boto3==1.34.0 \
    pymysql==1.1.0

# Health check
HEALTHCHECK --interval=30s --timeout=30s --start-period=5s --retries=3 \
    CMD curl -f http://localhost:5000/ || exit 1

EXPOSE 5000

CMD ["mlflow", "server", "--host", "0.0.0.0", "--port", "5000"]
