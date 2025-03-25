#!/bin/bash
# scripts/before_install.sh
# Stop any existing http-server and remove old files
if [ -d /var/www/html/myapp ]; then
    cd /var/www/html/myapp
    if pgrep -f "http-server" > /dev/null; then
        pkill -f "http-server"
    fi
fi

# Install Node.js and npm if not already installed
if ! command -v node &> /dev/null; then
    curl -sL https://rpm.nodesource.com/setup_16.x | bash -
    yum install -y nodejs
fi

if ! command -v http-server &> /dev/null; then
    npm install -g http-server
fi

# Make sure the destination directory exists
mkdir -p /var/www/html/myapp
