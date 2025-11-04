FROM python:3.9-slim

RUN pip install mlflow \
    boto3 \
    pymysql \
    cryptography

EXPOSE 5000

RUN mkdir -p /mlflow
WORKDIR /mlflow

CMD ["mlflow", "server", "--host", "0.0.0.0", "--port", "5000"]