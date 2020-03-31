#!/usr/bin/env bash

set -e

kill $(pgrep "redis-server \*:[0-9]+ \[cluster\]")