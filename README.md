# Testing Docker Compose Script
with shell scripts & nginx config.

## Images arch
- nginx:alpine
- php
- mysql:8

## Using
```bash
# Sync requirments.
chmod +x sync.sh && ./sync.sh

# Setup containers
docker-compose up
```
