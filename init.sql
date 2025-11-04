CREATE DATABASE IF NOT EXISTS mlflow_db;

CREATE USER IF NOT EXISTS 'mlflow_user'@'%' IDENTIFIED BY 'mlflow_password';

GRANT ALL PRIVILEGES ON mlflow_db.* TO 'mlflow_user'@'%';

FLUSH PRIVILEGES;