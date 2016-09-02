This repository contains two helpful scripts to manage the services needed to run NU Code.

See how all of those services interact under [the dispatch service](https://github.com/Tahler/nu-code-dispatch).

`start.sh` starts all of the services each in a Docker container under a common Docker network.

`stop.sh` stops and removes all of the containers and removes the Docker network.
