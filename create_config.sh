#!/usr/bin/env bash
set -ae
source .env
set +a


IFS="," read -ra CLUSTER_PORTS <<< "$PORTS"


# Config source https://redis.io/topics/cluster-tutorial
for port in "${CLUSTER_PORTS[@]}";do
  if [ -d "$port" ]; then
      rm -rf "$port"
  fi
  mkdir "$port" && touch "$port/redis.conf"
  cat << EOF > "$port/redis.conf"
port $port
cluster-enabled yes
cluster-config-file nodes.conf
cluster-node-timeout 5000
appendonly yes
EOF
done
