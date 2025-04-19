#!/bin/zsh

cat <<EOF > ../.env
# UID/GID for container user
UID=$(id -u)
GID=$(id -g)
EOF

echo ".env ファイルを生成しました ✅"

