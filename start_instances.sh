#!/usr/bin/env bash
set -ex

CLUSTER_PORTS=(7000 7001 7002 7003 7004 7005)
if [ -z "$(which redis-server)" ]; then
    printf "redis-server not found!"
    exit 1
fi


for port in "${CLUSTER_PORTS[@]}"; do
  printf "Starting instance :%s\n" "$port"
  (cd "$port" && redis-server ./redis.conf >/dev/null &)
done