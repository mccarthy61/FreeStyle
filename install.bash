#!/bin/bash
#
# UCSC Extension DevOps
# Michael McCarthy
# Homework 7
#

dockernetwork="UCSCDevOpsMicroServices"

echo "-------- check/build Docker Network ---------"
sudo docker network create --driver bridge $dockernetwork

# Build backend service 

cd backend
build-and-run-docker-backend.script 
cd ..

# Build frontend webservice. 

cd frontend
build-and-run-docker-frontend.script 
cd ..


# Valid queries to frontend
# *** The trailing url slash is required as shown to avoid an unresolved 301 redirect.
# http://<frontend localhost ip>:81/
# http://<frontend localhost ip>:81/grab/cpu_times/
# http://<frontend localhost ip>:81/grab/swap_memory/
# http://<frontend localhost ip>:81/grab/virtual_memory/
# http://<frontend localhost ip>:81/grab/net_if_addrs/

# Query from client (not Frontend), to backend
# http://<backend localhost ip>:80/


