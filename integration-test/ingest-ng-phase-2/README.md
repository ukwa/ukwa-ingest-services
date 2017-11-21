Ingest NG Phase 2 Test Deployment
=================================

This is a basic test version of the second iteration of our next-gen crawl engine.

This one routes all in-scope URIs via a Kafka queue, which can be used to reconstruct the frontier in the event of failure.

(see https://github.com/ukwa/ukwa-documentation/blob/master/Roadmap.md for more details)

To run it, it all you need is a 

    $ docker-compose pull

(to make sure the containers are up to date) and a 

    $ docker-compose up

To inject some test seeds into the crawl, you need to put them in the Kafka queue. This can be done from the `control` server.

   $ docker exec control sh
   # inject -k kafka:9092 -S uris-to-crawl http://acid.matkelly.com/
   # inject -k kafka:9092 -S uris-to-crawl http://crawl-test-site:4000/crawl-test-site/

Which means "send the URL of the Archival Acid Test site to the `uris-to-crawl` Kafka queue and mark it as a seed."

If you want to see what's going on, you can exit there and use the Kafka service to poke around:

   $ docker exec kafka sh
   # kafka-console-consumer --bootstrap-server kafka:9092 --topic uris-to-crawl --from-beginning

Which will emit all the requests in the `uris-to-crawl` stream. To see what happened, you can use:

   # kafka-console-consumer --bootstrap-server kafka:9092 --topic frequent-crawl-log --from-beginning

Which will emit the crawl log as a series of JSON messages. Alternatively, you can look at the output:

   $ ls testing/heritrix/output/logs/frequent/*
   $ ls testing/heritrix/output/warcs/frequent/*
   $ ls testing/heritrix/output/viral/frequent/*

