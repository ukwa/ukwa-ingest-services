#!/bin/sh

source /etc/sysconfig/w3act

curl -o w3act.pgdump "http://hdfs:14000/webhdfs/v1/2_backups/crawler01/pulsefeprod_postgres_1/w3act.pgdump-20180122?op=OPEN&user.name=hdfs"
mkdir /data/prod/postgresql-backups
cp w3act.pgdump /data/prod/postgresql-backups/

./docker-prod.sh up -d --no-deps postgres

echo "Importing data..."
./docker-prod.sh exec postgres pg_restore -d w3act -U w3act -O /var/lib/postgresql/backups/w3act.pgdump
echo "First upgrade to 2.0.x needs a TRUNCATE watched_target CASCADE; !!!"

echo "Shutting down..."
./docker-prod.sh down

