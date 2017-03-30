#!/bin/sh

./docker-prod.sh exec shepherd pulse stop daily
./docker-prod.sh exec shepherd pulse stop weekly
./docker-prod.sh exec shepherd pulse stop monthly
./docker-prod.sh exec shepherd pulse stop quarterly
./docker-prod.sh exec shepherd pulse stop sixmonthly
./docker-prod.sh exec shepherd pulse stop annual

