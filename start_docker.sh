#!/bin/bash

NETWORK_NAME="sophiag-network"

# 1. ネットワーク作成（存在しなければ）
if ! docker network ls --format '{{.Name}}' | grep -q "^${NETWORK_NAME}$"; then
  echo "Creating network: $NETWORK_NAME"
  docker network create $NETWORK_NAME
else
  echo "Network $NETWORK_NAME already exists."
fi

# 2. .env 生成
if [ ! -f .env ]; then
  ./generate-env.sh
fi

# 3. 起動
echo " Starting containers..."
docker ../compose up -d
