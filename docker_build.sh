#!/usr/bin/env bash

set -e 
docker build -t shawlynot/db:1 db
docker save -o db/build/db.tar shawlynot/db:1