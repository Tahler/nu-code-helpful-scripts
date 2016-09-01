#!/bin/sh

# Starts all the services needed to run NU Code

# Create the subnet for all services to run and communicate in
docker network create --subnet 172.18.0.0/16 nu-code

# Start the Compilation API
docker run -d --name compilation-api --net nu-code --ip 172.18.0.2 compilation-api

# Start the Submission API
docker run -d --name submission-api --net nu-code --ip 172.18.0.3 submission-api

# Start the Web Server
docker run -d --name web --net nu-code --ip 172.18.0.4 web

# Start the Dispatcher to proxy all services under one IP
docker run -d --name dispatch --net nu-code --ip 172.18.0.5 -p 80:80 dispatch
