Frequent Crawler Production Setup
---------------------------------

The production crawler setup is split into multiple stacks.

- `fc-kafka` runs the Kafka service for frequent crawling.
- `fc-crawl` runs the crawls (requires `fc-kafka` to be running).
- `fc-wb` runs a (optional) Wayback access point to look at the crawl results.


    $ docker swarm init --advertise-addr 192.168.45.15

fc-kafka


    $ docker stack deploy -c docker-compose.yml fc_kafka

```
mkdir /mnt/gluster/fc/zookeeper
mkdir /mnt/gluster/fc/zookeeper/data
mkdir /mnt/gluster/fc/zookeeper/datalog
mkdir /mnt/gluster/fc/kafka
```




