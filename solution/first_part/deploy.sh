#!/bin/sh
docker build ../app/ -t osmansays/random
#docker push osmansays/random
docker build ../reverseproxy/ -t osmansays/rproxy
#docker push osmansays/rproxy
docker-compose up -d
