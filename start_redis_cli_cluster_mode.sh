#!/usr/bin/env bash
set -ex

# Change port binding
PORT=7000

if [ -z "$(which redis-cli)" ]; then
    printf "redis-cli not found!"
    exit 1
fi

eval redis-cli "-c -p $PORT"