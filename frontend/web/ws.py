import os
import urllib
from nameko.dependency_providers import Config
from nameko.web.handlers import http
from urllib.request import urlopen
import sys
import psutil
import requests

class HttpService:
    name = "grab_client"


    config = Config()

    # Hello User! 
    @http('GET', '/')
    def get_IP(self, request):
        print("\n")
        ip = self.config.get('IP')
        print("\n")
        print("IP:  " + str(ip))
        print ("Calling Method 1 with python version: ",sys.version_info[:])
        print("\n")
        sys.stdout.flush()

        # Format output for client
        msg="ip=" + str(ip) + '\n'
        return msg 

    # Trailing slash required to avoid 301 redirect which fails. Not resolved.
    @http('GET', '/grab/<string:cmd>/')
#    def get_HTTP(self, request, cmd):
    def get_method1 (self, request, cmd):
#        print("\n")
#        print("IP:  " + cip)
#        print("\n")

#        with urllib.request.urlopen(cip) as response:
#            html = response.read()
#        html = html.decode("utf8")
#        response.close()

        cip = "http://"+BACKEND_IP + ":8000/" + cmd
        response = requests.get (cip)
        html = requests.text
        print (cmd, ": ", html)
        return html
        
def get_HTTP (SERVER_IP, cmd):
    if (cmd == "/"):
        cmd = ""
    cip = "http://"+SERVER_IP + ":8000/" + cmd
    response = requests.get (cip)
    html = response.text
#    print (cmd, ": ", html)
    return html
                
def main():
#    ip = self.config.get('IP')
#    print("\n")
#    print("Workstation IP:  " + ip)
#    print("\n")

#    SERVER_IP = os.environ['BACKEND_IP']
    SERVER_IP = "localhost"
#    print ("\n")
    print ("SERVER_IP:  " + SERVER_IP)
#    print ("\n")

#    cip = "http://"+SERVER_IP + ":8000/"

#    response = requests.get('http://localhost:8000/')
    html=get_HTTP (SERVER_IP, "/")
    print ("Menu: ", html)
#    print ("\n")

#    response = requests.get('http://localhost:8000/cpu_times')
    html=get_HTTP (SERVER_IP, "cpu_times")
    print ("CPU Times: ", html)
#    print ("\n")
    
#    response = requests.get('http://localhost:8000/cpu_times')
    html=get_HTTP (SERVER_IP, "virtual_memory")
    print ("Virtual Memory: ", html)
#    print ("\n")

#    response = requests.get('http://localhost:8000/virtual_memory')
    html=get_HTTP (SERVER_IP, "swap_memory")
    print ("Virtual Memory: ", html)
#    print ("\n")

 #    response = requests.get('http://localhost:8000/net_if_addrs')
    html=get_HTTP (SERVER_IP, "net_if_addrs")
    print ("Net if Addresses: ", html)
#    print ("\n")
   
if __name__ == "__main__":
    main()
