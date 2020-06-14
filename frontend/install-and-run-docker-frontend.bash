#!/bin/bash


# UCSC Extension DevOps
# Homework 7
#
#
# Build and Run Docker Frontend
#

cd ~/UCSC/DevOps/d6/frontend/

sudo docker images | grep ws:latest
# if %ERRORLEVEL% NEQ 0 (
    echo 'building frontend docker image'
    sudo docker build web --rm -t ws:latest
# )

# Start docker ws service in background as ws

set dockernetwork="UCSCDevOpsMicroServices"

sudo docker inspect --format {{.NetworkSettings.Networks.%dockernetwork%.IPAddress}} daemon > BACKEND_IPADDR
# echo ""
# set /p BACKEND_IPADDR= < BACKEND_IPADDR.TXT 
# del BACKEND_IPADDR.TXT
# set BACKEND_IPADDR="172.19.0.2"
echo "Backend IP is: " $BACKEND_IPADDR

sudo docker run --rm -d --name ws -p 81:8000 --network $dockernetwork -e BACKEND_IP=$BACKEND_IPADDR ws

