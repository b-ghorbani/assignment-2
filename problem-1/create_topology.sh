#!/bin/bash
set -e

# remove olds
ip netns del node1 2>/dev/null || true
ip netns del node2 2>/dev/null || true
ip netns del router 2>/dev/null || true
ip link del br1 2>/dev/null || true
ip link del br2 2>/dev/null || true

# create namespace
ip netns add node1
ip netns add node2
ip netns add router

# create bridges
ip link add br1 type bridge
ip link set br1 up
ip link add br2 type bridge
ip link set br2 up

# create veth and connection
ip link add veth1 type veth peer name veth1-br
ip link set veth1 netns node1
ip link set veth1-br master br1
ip link set veth1-br up

ip link add veth2 type veth peer name veth2-br
ip link set veth2 netns node2
ip link set veth2-br master br2
ip link set veth2-br up

ip link add vethr1 type veth peer name vethr1-br
ip link set vethr1 netns router
ip link set vethr1-br master br1
ip link set vethr1-br up

ip link add vethr2 type veth peer name vethr2-br
ip link set vethr2 netns router
ip link set vethr2-br master br2
ip link set vethr2-br up

# set IPs
ip netns exec node1 ip addr add 172.0.0.2/24 dev veth1
ip netns exec node1 ip link set veth1 up
ip netns exec node2 ip addr add 10.10.1.2/24 dev veth2
ip netns exec node2 ip link set veth2 up
ip netns exec router ip addr add 172.0.0.1/24 dev vethr1
ip netns exec router ip addr add 10.10.1.1/24 dev vethr2
ip netns exec router ip link set vethr1 up
ip netns exec router ip link set vethr2 up

# enable loopback
ip netns exec node1 ip link set lo up
ip netns exec node2 ip link set lo up
ip netns exec router ip link set lo up

# set default gateway
ip netns exec node1 ip route add default via 172.0.0.1
ip netns exec node2 ip route add default via 10.10.1.1

# enable IP forwarding on router
ip netns exec router sysctl -w net.ipv4.ip_forward=1

echo "Topology created successfully."

