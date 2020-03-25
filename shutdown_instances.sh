#!/usr/bin/env bash

set -ex


PORTS=(7000 7001 7002 7003 7004 7005)

if [ -z "$(which redis-cli)" ]; then
  printf "redis-cli not found"
fi

for port in "${PORTS[@]}"; do
  eval redis-cli "-p $port shutdown"
done
