#!/usr/bin/env bash

set -ae
source .env
set +a


IFS="," read -ra CLUSTER_PORTS <<< "$PORTS"

if [ -z "$(which redis-cli)" ]; then
  printf "redis-cli not found"
fi

for port in "${CLUSTER_PORTS[@]}"; do
  eval redis-cli "-p $port shutdown"
done
