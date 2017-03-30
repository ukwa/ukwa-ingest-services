#!/bin/sh

source /etc/sysconfig/w3act

scp root@sh.wa.bl.uk:/backups/psql/crawler07.n45.bl.uk-pulseprod_postgres_1-w3act.pgdump-20170329 w3act.pgdump
mkdir -p /data/prod/postgresql
cp w3act.pgdump /data/prod/postgresql/

./docker-prod.sh up -d postgres

sleep 10

echo "Importing data..."
./docker-prod.sh exec postgres pg_restore -d w3act -U w3act -O /var/lib/postgresql/data/w3act.pgdump
echo "First upgrade to 2.0.x needs a TRUNCATE watched_target CASCADE; !!!"

sleep 10

echo "Shutting down..."
./docker-prod.sh down

