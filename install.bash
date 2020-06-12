#!/bin/bash
#
# UCSC Extension DevOps
# Michael McCarthy
# Homework 6
#

dockernetwork="UCSCDevOpsMicroServices"

echo "-------- check/build Docker Network ---------"
sudo docker network create --driver bridge $dockernetwork

# Misc Notes

# To recompile web server on frontend from /frontend outside vagrant
# vagrant provision --provision-with frontend

# To recompile web server on backend from /backend outside vagrant
# vagrant provision --provision-with backend

# To see logs on frontend from /frontend outside vagrant
# vagrant ssh -- 'docker logs ws'

# To see logs on backend from /backend outside vagrant
# vagrant ssh -- 'docker logs daemon'

# To test frontend from /frontend outside vagrant
# vagrant ssh -- 'curl localhost'

# To test backend from /backend outside vagrant
# vagrant ssh -- 'curl localhost'

# Build backend service 

cd backend
# build-and-run-docker-backend.script 
cd ..

# Build frontend webservice. 

cd frontend
# build-and-run-docker-frontend.script 
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


