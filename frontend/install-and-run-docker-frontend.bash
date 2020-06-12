#!/bin/bash
#
# UCSC Extension DevOps
# Homework 6
# Michael McCarthy
#
# Build and Run Docker Backend
#

dockernetwork="UCSCDevOpsMicroServices"
BACKEND_IPADDR=""
cd ~/UCSC/DevOps/d6/frontend

# docker images | findstr ws:latest
# if %ERRORLEVEL% NEQ 0 (

echo 'building frontendend docker image'
docker build web --rm -t ws:latest

# )

# Start docker ws service in background as ws

echo ""
BACKEND_IPADDR='docker inspect --format {{.NetworkSettings.Networks.$dockernetwork.IPAddress}} daemon' 
echo ""

# docker inspect -f '{{range .NetworkSettings.Networks}}{{.IPAddress}}{{end}}' daemon > %BACKEND_IPADDR%

echo "Backend IP is: " $BACKEND_IPADDR

docker run --rm -d --name ws -p 81:8000 --network $dockernetwork -e BACKEND_IP=$BACKEND_IPADDR ws


