#!/usr/bin/env bash

function __message() {
  GREEN='\033[0;32m'
  NO_COLOR='\033[0m'
  printf "${GREEN}[+]${NO_COLOR} $@"
}

if [ "$1" = "start" ] ; then
  command="up"
  message="Starting"
elif [ "$1" = "stop" ] ; then
  command="down"
  message="Stopping"
fi

__message "$message MongoDB\n"
cd local/mongo-db && docker-compose $command -d && cd ~-
printf "\n"
