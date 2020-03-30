#!/usr/bin/env bash

set -a
source .env
set +a

IFS="," read -ra arr <<< "$PORTS"

printf "%s\n" "REPLICATION_FACTOR=${REPLICATION_FACTOR}"

for port in "${arr[@]}"; do
  printf  "%s\n" "INSTANCE:-> ${HOST}:${port}"
done

