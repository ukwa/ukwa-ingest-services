#!/bin/sh

./docker-prod.sh exec shepherd pulse resume daily
./docker-prod.sh exec shepherd pulse resume weekly
./docker-prod.sh exec shepherd pulse resume monthly
./docker-prod.sh exec shepherd pulse resume quarterly
./docker-prod.sh exec shepherd pulse resume sixmonthly
./docker-prod.sh exec shepherd pulse resume annual

