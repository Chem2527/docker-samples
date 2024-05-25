#!/bin/bash
set -eo pipefail

# Use the service name from docker-compose.yml to determine the host IP
host="db"

# Set default values for user and database
user="${POSTGRES_USER:-postgres}"
db="${POSTGRES_DB:-$POSTGRES_USER}"

# Set password if provided, else it will be empty
export PGPASSWORD="${POSTGRES_PASSWORD:-}"

# Arguments for connecting to PostgreSQL
args=(
    --host "$host"
    --username "$user"
    --dbname "$db"
    --quiet --no-align --tuples-only
)

# Check if PostgreSQL server is reachable by running a simple query
if select="$(echo 'SELECT 1' | psql "${args[@]}")" && [ "$select" = '1' ]; then
    exit 0
fi

exit 1

