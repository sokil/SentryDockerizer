#!/bin/bash

# check if database initialised
if [[ -d ./share/pgdata ]];
then
    echo 'Sentry already installed. Start it or remove ./share directory and relaunch ./install.sh'
    exit
fi

# start docker containers
# demonized up is required to go to next command
docker-compose up -d

# start migration
docker exec -it sentry-www sentry upgrade

# welcome message
echo -e "\n\033[0;32mOpen http://127.0.0.1:9050/ in your browser\033[0m"
