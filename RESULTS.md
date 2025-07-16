# Assignment 2 - Results Summary

## Problem 1 - Container Networking

- **Topology creation output:**  

net.ipv4.ip_forward = 1
Topology created successfully.


- **Ping from node1 to node2:**  

PING 10.10.1.2 (10.10.1.2) 56(84) bytes of data.
64 bytes from 10.10.1.2: icmp_seq=1 ttl=63 time=0.416 ms
64 bytes from 10.10.1.2: icmp_seq=2 ttl=63 time=0.173 ms
--- 10.10.1.2 ping statistics ---
2 packets transmitted, 2 received, 0% packet loss, time 1023ms
rtt min/avg/max/mdev = 0.173/0.294/0.416/0.121 ms


- **Ping from node1 to router:**  

PING 172.0.0.1 (172.0.0.1) 56(84) bytes of data.
64 bytes from 172.0.0.1: icmp_seq=1 ttl=64 time=0.248 ms
--- 172.0.0.1 ping statistics ---
1 packets transmitted, 1 received, 0% packet loss, time 0ms
rtt min/avg/max/mdev = 0.248/0.248/0.248/0.000 ms


---

## Problem 2 - Simple Container Runtime

- **Create root filesystem:**  


---

## Problem 2 - Simple Container Runtime

- **Create root filesystem:**  

sudo debootstrap --arch=amd64 focal ./ubuntu_rootfs http://archive.ubuntu.com/ubuntu/


- **Run container:**  
sudo python3 simple_container.py mycontainer


- **Inside container:**  


root@mycontainer:/# hostname
mycontainer
root@mycontainer:/# exit
exit


---

## Problem 3 - Containerized HTTP Server

- **Docker image build:**  


---

## Problem 3 - Containerized HTTP Server

- **Docker image build:**  
docker build -t simple-http-server .

- **Docker images list:**  

REPOSITORY TAG IMAGE ID CREATED SIZE
simple-http-server latest 273ad2655c2a1 33 seconds ago 138MB


- **Run container:**  
docker run -p 8000:8000 simple-http-server


- **Sample API request log:**  
172.17.0.1 - - [08/Jul/2025 07:32:39] "GET /api/v1/status HTTP/1.1" 200 -

Notes:

All parts have been executed successfully.

Documentation is available in each problem's folder.

Code and outputs are up-to-date and pushed to the main branch

 




