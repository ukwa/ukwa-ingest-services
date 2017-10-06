Ingest NG Phase 2 Test Deployment
=================================

This is a basic test version of the second iteration of our next-gen crawl engine.

This one routes all in-scope URIs via a Kafka queue, which can be used to reconstruct the frontier in the event of failure.

(see https://github.com/ukwa/ukwa-documentation/blob/master/Roadmap.md for more details)

To run it, it all you need is a 

    $ docker-compose up

To inject some test seeds into the crawl, you need to put them in the Kafka queue.

