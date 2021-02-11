#!/bin/sh
docker build ../app/ -t osmansays/random:latest
docker push osmansays/random:latest
docker build ../reverseproxy/ -t osmansays/rproxy:lates
docker push osmansays/rproxy:latest
VER=latest docker-compose up -d
