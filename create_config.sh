#!/usr/bin/env bash
set -ex


# Change the default port bindings
CLUSTER_PORTS=(7000 7001 7002 7003 7004 7005)

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
