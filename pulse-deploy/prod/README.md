Production setup
================

Crawls should generally be launched at appropriate times via cron. e.g. This starts (or restarts) the daily crawl stream:


    cd pulse/pulse-deploy/prod
    ./docker-prod.sh exec shepherd pulse start daily

This uses the `docker-prod.sh` helper script, which makes sure the correct Docker Compose files are used and loads the correct environment variables

In the case of a planned system shutdown, the following will stop and checkpoint all the crawlers...

    ./docker-prod.sh exec shepherd pulse stop daily
    ./docker-prod.sh exec shepherd pulse stop weekly
    ./docker-prod.sh exec shepherd pulse stop monthly
    ./docker-prod.sh exec shepherd pulse stop quarterly
    ./docker-prod.sh exec shepherd pulse stop sixmonthly
    ./docker-prod.sh exec shepherd pulse stop annual

Note that a 'neat' shutdown may take a while as it waits for each downloader ToeThread to finish.

For unplanned outages, note that the crawlers all checkpoint every four hours, so even a hard shutdown can usually be resumed.

To resume the crawls from the last checkpoint, use the `resume` command:

    ./docker-prod.sh exec shepherd pulse resume daily
    ./docker-prod.sh exec shepherd pulse resume weekly
    ./docker-prod.sh exec shepherd pulse resume monthly
    ./docker-prod.sh exec shepherd pulse resume quarterly
    ./docker-prod.sh exec shepherd pulse resume sixmonthly
    ./docker-prod.sh exec shepherd pulse resume annual


