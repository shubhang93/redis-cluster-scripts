#!/usr/bin/env bash
set -ae
source .env
set +a

IFS="," read -ra CLUSTER_PORTS <<< "$PORTS"

if [ -z "$(which redis-server)" ]; then
    printf "redis-server not found!"
    exit 1
fi


for port in "${CLUSTER_PORTS[@]}"; do
  printf "Starting instance :%s\n" "$port"
  (cd "$port" && redis-server ./redis.conf >/dev/null &)
done