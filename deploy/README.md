Pulse Docker Deployment
=======================

Our crawl engine is deployed in two parts, the crawl engine and the front end.

In each case there is a shared overall `docker-compose.yml` configuration file, with two Docker Compose override files corresponding to BETA and PRODUCTION. These configuration files contain only those properties that differ between the two deployment contexts. This mostly involves setting the values for environment variables that point to specific systems, but may also include additional Docker services if necessary.

A helper script is provided to combine the Docker Compose files, see e.g. `./crawl-engine/beta/docker-beta.sh`. To use them change into the appropriate folder:

    $ cd crawl-engine/beta

...and run e.g.

    $ ./docker-beta.sh -d up

...which will fire up the front-end services for the BETA version.

