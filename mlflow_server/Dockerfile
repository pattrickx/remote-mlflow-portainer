FROM python:3.9-slim

WORKDIR /app

# Atualizar pip primeiro
RUN pip install --upgrade pip

# Instalar dependências uma por uma para debug
RUN pip install mlflow==2.11.3
RUN pip install boto3==1.34.0
RUN pip install pymysql==1.1.0

EXPOSE 5000

CMD ["mlflow", "server", "--host", "0.0.0.0", "--port", "5000"]
