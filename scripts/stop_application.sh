#!/bin/bash
# scripts/stop_application.sh
# Stop the http-server service if it's running
if systemctl is-active --quiet http-server; then
    systemctl stop http-server
fi
