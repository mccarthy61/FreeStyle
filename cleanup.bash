#!/bin/bash
#
# UCSC Extension DevOps
# Homework 7
# cleanup.bat
#

dockernetwork="UCSCDevOpsMicroServices"

# kill backend docker container

docker container stop daemon


# remove backend docker image

docker image rm daemon:latest


# kill frontend docker container

docker container stop ws


# remove frontend docker image

docker image rm ws:latest


# remove user-defined bridged docker network

docker network rm $dockernetwork
