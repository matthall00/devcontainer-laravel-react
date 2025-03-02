#!/bin/bash

echo "🚀 Running post-start setup..."

# Ensure correct permissions, but skip .git directory
sudo find /workspace -path /workspace/.git -prune -o -exec chown vscode:vscode {} +

# Update dependencies
if [ -d "/workspace/api" ]; then
    echo "📦 Updating Laravel dependencies..."
    cd /workspace/api
    composer install
fi

if [ -d "/workspace/client" ]; then
    echo "📦 Updating React dependencies..."
    cd /workspace/client
    npm install
fi

echo "✅ Post-start setup complete!"
