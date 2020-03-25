#!/usr/bin/env bash
set -ex

CLUSTER_PORTS=(7000 7001 7002 7003 7004 7005)

for port in "${CLUSTER_PORTS[@]}";do
  rm "./$port/nodes.conf"
	eval redis-cli "-p $port flushall"
  done

