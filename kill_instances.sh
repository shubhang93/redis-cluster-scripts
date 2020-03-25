#!/usr/bin/env bash

set -ex

kill $(pgrep "redis-server \*:[0-9]+ \[cluster\]")