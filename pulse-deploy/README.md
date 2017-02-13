Pulse Deployment Configuration
==============================

We use Docker Compose and leverage it's ability to [share configuration files](https://docs.docker.com/compose/extends/) to make managing our different deployments simpler.

The base configuration is in `docker-compose.yml` and the _usual_ settings for mid-development test deployment are in `docker-compose.override.yml`, which will be automatically picked up when running `docker-compose` commands.

The _beta_ configuration is the equivalent of the _override_ but set-up for our Beta service. It can be use like this:

    cd beta
    docker-compose -f ../docker-compose.yml -f docker-compose.beta.yml -p pulse_beta up -d

For production, this has been wrapped up in a script (n.b. uses relative paths):

    cd prod
    ./docker-prod.sh up -d



