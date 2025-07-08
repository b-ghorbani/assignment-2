#!/bin/bash
set -e

if [ $# -ne 2 ]; then
  echo "Usage: $0 <from_node> <to_node>"
  exit 1
fi

declare -A node_ips=( ["node1"]="172.0.0.2" ["node2"]="10.10.1.2" ["router"]="172.0.0.1" )

from=$1
to=$2

if [[ -z "${node_ips[$from]}" || -z "${node_ips[$to]}" ]]; then
  echo "Invalid node names"
  exit 1
fi

ip netns exec $from ping -c 4 ${node_ips[$to]}

