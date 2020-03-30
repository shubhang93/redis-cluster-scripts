#!/usr/bin/env bash
set -aex
source .env
set +a


IFS="," read -ra CLUSTER_PORTS <<< "$PORTS"



if [ -z "$(which redis-cli)" ]; then
    printf "redis-cli not found!"
    exit 1
fi



CLUSTER_ARGS=""

for port in "${CLUSTER_PORTS[@]}"; do
  CLUSTER_ARGS+="${HOST}:${port} "
  done



eval redis-cli "--cluster create $CLUSTER_ARGS --cluster-replicas $REPLICATION_FACTOR"


