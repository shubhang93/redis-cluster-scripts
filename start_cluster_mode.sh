#!/usr/bin/env bash

set -ex

if [ -z "$(which redis-cli)" ]; then
    printf "redis-cli not found!"
    exit 1
fi

REDIS_HOSTNAME="127.0.0.1"
PORTS=(7000 7001 7002 7003 7004 7005)

CLUSTER_ARGS=""

for port in "${PORTS[@]}"; do
  CLUSTER_ARGS+="${REDIS_HOSTNAME}:${port} "
  done



eval redis-cli "--cluster create $CLUSTER_ARGS"


