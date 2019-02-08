#!/bin/sh

# Pull in configuration environment variables:
source /etc/sysconfig/w3act-beta

# Launch with correct combined configuration:
docker stack deploy -c docker-compose.yml ife_beta
