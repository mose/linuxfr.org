#!/bin/bash

DOCKIP=""

launch() {
  docker -d --name linuxfr mose/linuxfr-dev
  DOCKIP=$( docker inspect -f "{{.NetworkSettings.IPAddress}}" linuxfr)
  if ! grep $DOCKIP /etc/hosts &> /dev/null; then
    sudo sh -c "echo $DOCKIP linuxfr.dev >> /etc/hosts"
  fi
  echo "Un containeur a ete lance sur $DOCKIP."
  echo "ssh root@$DOCKIP (pass: docker)"
}

launch
