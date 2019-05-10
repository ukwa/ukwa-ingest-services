Frequent Crawler Production Setup
---------------------------------

The production crawler setup is split into multiple stacks.

- `fc-kafka` runs the Kafka service for frequent crawling.
- `fc-crawl` runs the crawls (requires `fc-kafka` to be running).
- `fc-wb` runs a (optional) Wayback access point to look at the crawl results.


    $ docker swarm init --advertise-addr 192.168.45.15

The crawler needs to be in public DNS, so lookups get back to us.

The crawler needs a few firewall ports opening up.



fc-kafka


    $ docker stack deploy -c docker-compose.yml fc_kafka

```
mkdir /mnt/gluster/fc/zookeeper
mkdir /mnt/gluster/fc/zookeeper/data
mkdir /mnt/gluster/fc/zookeeper/datalog
mkdir /mnt/gluster/fc/kafka
```




     docker run --network="host" ukwa/ukwa-manage submit -k ${CRAWL_HOST_INTERNAL_IP}:9094 -L now  -S fc.tocrawl.npld http://acid.matkelly.com/

