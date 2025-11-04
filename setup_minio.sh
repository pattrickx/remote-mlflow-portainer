#!/bin/sh

# Wait for MinIO to be ready
echo "Waiting for MinIO to start..."
until mc alias set myminio http://minio:9000 ROOTNAME CHANGEME123 > /dev/null 2>&1; do
  echo 'Waiting for MinIO...'
  sleep 2
done

echo "MinIO is ready. Setting up buckets and users..."

# Create the bucket
mc mb myminio/flow-bucket --ignore-existing

# Create MLFlow user
mc admin user add myminio MLFlowUser MyFlowPass

# Apply readwrite policy for MLFlow user
mc admin policy set myminio readwrite user=MLFlowUser

echo "MinIO setup completed successfully!"
echo "Bucket 'flow-bucket' created"
echo "User 'MLFlowUser' configured"