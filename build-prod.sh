#!/bin/sh
# Requires docker to be installed, in the path, and running.
# Note: Must be run from the `helpful-scripts` directory.

npm install -g gulp
npm install -g @angular/cli

cd ../compilation-api \
  && npm install \
  && gulp build-api \
  && gulp build-compiler \
  && cd helpful-scripts

cd ../submission-api \
  && npm install \
  && gulp build \
  && cd helpful-scripts

cd ../web \
  && npm install \
  && ng build -prod \
  && docker build -t web . \
  && cd helpful-scripts

cd ../dispatch \
  && docker build -t dispatch . \
  && cd helpful-scripts
