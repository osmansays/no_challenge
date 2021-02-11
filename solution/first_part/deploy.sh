#!/bin/sh
docker build ../app/ -t osmansays/random:test
docker push osmansays/random:test
docker build ../reverseproxy/ -t osmansays/rproxy:test
docker push osmansays/rproxy:test
VER=test docker-compose up -d
