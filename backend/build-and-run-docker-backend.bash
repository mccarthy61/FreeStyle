#!/bin/bash


# UCSC Extension DevOps
# Homework 7
#
# Build and Run Docker Backend
#

cd ~/UCSC/DevOps/d6/backend

sudo docker images | grep daemon

# if %ERRORLEVEL% NEQ 0 (
#    echo 'building backend docker image'
sudo docker build daemon -t daemon:latest
# )

echo '***** running backend docker image ******'
dockernetwork="UCSCDevOpsMicroServices"
echo %dockernetwork%

sudo docker run --rm -it -d --name daemon -p 80:8000 --network $dockernetwork daemon:latest


