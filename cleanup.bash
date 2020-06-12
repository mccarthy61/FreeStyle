@echo off
rem
rem UCSC Extension DevOps
rem Homework 6
rem Michael McCarthy
rem
rem c.bat, cleanup

set dockernetwork="UCSCDevOpsMicroServices"

rem kill backend docker container

rem docker container stop nginx02-container


rem remove backend docker image

rem docker image rm ucsc-devops/nginx01


rem kill frontend docker container

rem docker container stop nginx02-container


rem remove frontend docker image

rem docker image rm ucsc-devops/nginx01


rem remove user-defined bridged docker network

docker network rm %dockernetwork%
