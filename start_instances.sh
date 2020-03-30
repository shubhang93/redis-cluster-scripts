#!/usr/bin/env bash
set -aex
source .env
set +a


if [ -z "$(which redis-server)" ]; then
    printf "redis-server not found!"
    exit 1
fi


for port in "${PORTS[@]}"; do
  printf "Starting instance :%s\n" "$port"
  (cd "$port" && redis-server ./redis.conf >/dev/null &)
done