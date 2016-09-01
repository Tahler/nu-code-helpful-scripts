#!/bin/sh

# Unwinds the start script

docker kill dispatch
docker kill web
docker kill submission-api
docker kill compilation-api

docker rm dispatch
docker rm web
docker rm submission-api
docker rm compilation-api

docker network rm nu-code
