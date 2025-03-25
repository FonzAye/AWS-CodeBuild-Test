#!/bin/bash
# scripts/validate_service.sh
# Validate that http-server is running and responding
sleep 5
HTTP_RESPONSE=$(curl -s -o /dev/null -w "%{http_code}" http://localhost:8080)

if [ "$HTTP_RESPONSE" -eq 200 ]; then
    echo "Service is running properly"
    exit 0
else
    echo "Service validation failed"
    exit 1
fi
