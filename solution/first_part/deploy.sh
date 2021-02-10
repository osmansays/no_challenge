#!/bin/sh
sudo docker build ../app/ -t osmansays/rundom
sudo docker push osmansays/random
sudo docker build ../reverseproxy/ -t osmansays/rproxy
sudo docker push osmansays/rproxy
sudo docker-compose up -d
