#!/usr/bin/env bash

set -e 
docker build -t ghcr.io/shawlynot/db:latest db
docker push ghcr.io/shawlynot/db:latest