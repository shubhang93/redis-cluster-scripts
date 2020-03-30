#!/usr/bin/env bash
set -ax
source .env
set +a


IFS="," read -ra CLUSTER_PORTS <<< "$PORTS"



for port in "${CLUSTER_PORTS[@]}";do
  rm "./$port/nodes.conf"
	eval redis-cli "-p $port flushall"
  done

