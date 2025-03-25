#!/bin/bash
# scripts/start_application.sh
# Start the http-server as a background service
cd /var/www/html/myapp

# Create a systemd service file for http-server
cat > /etc/systemd/system/http-server.service << 'EOL'
[Unit]
Description=http-server for static website
After=network.target

[Service]
Type=simple
User=ec2-user
WorkingDirectory=/var/www/html/myapp
ExecStart=/usr/bin/http-server -p 8080
Restart=always
RestartSec=10

[Install]
WantedBy=multi-user.target
EOL

# Reload systemd, enable and start the service
systemctl daemon-reload
systemctl enable http-server
systemctl start http-server
