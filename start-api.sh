#!/bin/bash
cd /home/ubuntu/api || { echo "Failed to change directory"; exit 1; }
exec /usr/bin/dotnet watch run >> /home/ubuntu/api/api.log 2>&1
