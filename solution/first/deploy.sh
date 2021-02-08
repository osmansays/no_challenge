#!/bin/sh
docker build ../app/ -t rundomnum
docker build ../reverseproxy/ -t reverseproxy
docker-compose up -d
