#!/bin/bash


# UCSC Extension DevOps
# Homework 7
# test.bat



# HTTP Requests to daemon and ws
# use curl
# to return values from psutil () calls on daemon

# GET the menu from daemon

curl --request GET http://127.0.0.1:81/

# GET the menu from ws who then calls daemon to execute psutil() and return the menu

curl --request GET http://127.0.0.1:80/

# GET the menu from ws who then calls daemon to execute psutil() and return the cpu_times

curl --request GET http://127.0.0.1:80/cpu_times

# GET the menu from ws who then calls daemon to execute psutil() and return the virtual memory

curl --request GET http://127.0.0.1:80/virtual_memory

# GET the menu from ws who then calls daemon to execute psutil() and return the swap memory

curl --request GET http://127.0.0.1:80/swap_memory

# GET the menu from ws who then calls daemon to execute psutil() and return the configuration
# information of the network interfaces

curl --request GET http://127.0.0.1:80/net_if_addrs

