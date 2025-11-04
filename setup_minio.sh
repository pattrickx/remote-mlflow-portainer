# setup_minio.sh - Versão Melhorada
#!/bin/sh

set -e

echo "🚀 Starting MinIO setup..."

# Wait for MinIO to be ready
echo "⏳ Waiting for MinIO to start..."
while ! mc alias set myminio http://minio:9000 ROOTNAME CHANGEME123 > /dev/null 2>&1; do
  echo '📡 Waiting for MinIO to be ready...'
  sleep 3
done

echo "✅ MinIO is ready!"

# Create bucket
echo "📦 Creating bucket..."
mc mb myminio/flow-bucket --ignore-existing || echo "⚠️  Bucket might already exist"

# Set public policy for testing
echo "🔓 Setting public policy..."
mc anonymous set download myminio/flow-bucket || echo "⚠️  Could not set policy"

# Create MLFlow user
echo "👤 Creating MLFlow user..."
if mc admin user list myminio | grep -q MLFlowUser; then
  echo "✅ MLFlowUser already exists"
else
  mc admin user add myminio MLFlowUser MyFlowPass
  echo "✅ MLFlowUser created"
fi

# Apply policy
echo "🔑 Applying policies..."
mc admin policy attach myminio readwrite --user MLFlowUser || echo "⚠️  Could not attach policy"

# Verify setup
echo "🔍 Verifying setup..."
mc ls myminio/flow-bucket > /dev/null && echo "✅ Bucket is accessible"
mc admin user list myminio | grep -q MLFlowUser && echo "✅ User is configured"

echo "🎉 MinIO setup completed successfully!"
echo "   Bucket: flow-bucket"
echo "   User: MLFlowUser"
echo "   Console: http://localhost:9003 (ROOTNAME/CHANGEME123)"
