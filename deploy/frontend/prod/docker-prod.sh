#!/bin/sh

# Pull in configuration environment variables:
source /etc/sysconfig/w3act

# Launch with correct combined configuration:
docker-compose -f docker-compose.yml -f docker-compose.prod.yml -p pulsefeprod "$@"
