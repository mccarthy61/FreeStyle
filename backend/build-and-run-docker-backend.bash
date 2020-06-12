#!/bin/bash
#
# UCSC Extension DevOps
# Homework 6
# Michael McCarthy
#
# Build and Run Docker Backend
#

cd ~/UCSC/DevOps/d6/backend

# docker images | findstr daemon
# if %ERRORLEVEL% NEQ 0 (

echo 'building backend docker image'
docker build daemon -t daemon:latest

# )

echo '***** running backend docker image ******'
dockernetwork="UCSCDevOpsMicroServices"
echo $dockernetwork

docker run --rm -it -d --name daemon -p 80:8000 --network $dockernetwork daemon:latest




