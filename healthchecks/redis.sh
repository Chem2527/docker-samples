#!/bin/sh
set -eo pipefail

# Use the service name from docker-compose.yml to determine the host IP
host="redis"

# Check if Redis server is reachable using redis-cli
if ping="$(redis-cli -h "$host" ping)" && [ "$ping" = 'PONG' ]; then
    exit 0
fi

exit 1
