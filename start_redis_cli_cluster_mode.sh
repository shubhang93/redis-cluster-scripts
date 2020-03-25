#!/usr/bin/env bash
set -ex

# Change port binding
PORT=7000

if [ -z "$(which redis-server)" ]; then
    printf "redis-server not found!"
    exit 1
fi

eval redis-cli "-c -p $PORT"