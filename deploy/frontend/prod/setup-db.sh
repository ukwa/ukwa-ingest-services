#!/bin/sh

source /etc/sysconfig/w3act-prod

curl -o w3act.pgdump "http://hdfs:14000/webhdfs/v1/2_backups/crawler03/pulsefeprod_postgres_1/w3act.pgdump-20190509-0927?op=OPEN&user.name=access"
mkdir /data/prod/postgresql-backups
cp w3act.pgdump /data/prod/postgresql-backups/

docker-compose -f ../docker-compose.yml up -d --no-deps postgres

echo "Importing data..."
docker-compose -f ../docker-compose.yml exec postgres pg_restore -d w3act -U w3act -O /var/lib/postgresql/backups/w3act.pgdump
echo "First upgrade to 2.0.x needs a TRUNCATE watched_target CASCADE; !!!"

echo "Shutting down..."
docker-compose -f ../docker-compose.yml down

