#!/bin/bash

set -eu

# 分 を引数で指定する
# デフォルトは10 (10分)
minutes=${1:-10}

since_time=$(date -d "$minutes minutes ago" +"%Y-%m-%d %H:%M:%S")

pt-query-digest \
  --since "${since_time}" \
  /var/log/mysql/mysql-slow.log
