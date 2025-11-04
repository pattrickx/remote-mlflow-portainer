FROM python:3.9-slim

WORKDIR /app

# Atualizar pip primeiro
RUN pip install --upgrade pip

# Instalar dependências uma por uma para debug
RUN pip install mlflow
RUN pip install boto3
RUN pip install pymysql
EXPOSE 5000

CMD ["mlflow", "server", "--host", "0.0.0.0", "--port", "5000"]
