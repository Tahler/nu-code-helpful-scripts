#!/bin/sh
# Requires docker to be installed, in the path, and running.
# Note: Must be run from the `helpful-scripts` directory.

npm install -g gulp
npm install -g @angular/cli

cd ..

cd compilation-api \
  && npm install \
  && gulp build-api \
  && gulp build-compiler \
  && cd ..

cd submission-api \
  && npm install \
  && gulp build \
  && cd ..

cd web \
  && npm install \
  && ng build \
  && docker build -t web . \
  && cd ..

cd dispatch \
  && docker build -t dispatch . \
  && cd ..

cd helpful-scripts
