#!/bin/bash
# scripts/after_install.sh
# Navigate to app directory
cd /var/www/html/myapp

# Install dependencies if package.json exists
if [ -f "package.json" ]; then
    npm install
fi

# Set proper permissions
chown -R ec2-user:ec2-user /var/www/html/myapp
