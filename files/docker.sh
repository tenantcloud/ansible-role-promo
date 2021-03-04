#!/usr/bin/env bash

# shellcheck disable=SC1090

# Added path to 'tcctl' in PATH variable
cd "$(dirname "$0")"/../../ || exit
PATH=$(pwd)/cli:$PATH

docker-compose exec -T www composer install --no-interaction --prefer-dist --optimize-autoloader
docker run --rm -i --network=tc-www-network --mount source=tc-www-nfsmount,target=/app \
  -w /app --entrypoint "/app/sh/install/minio.sh"  minio/mc:latest
$(command -v yarn) ci
$(command -v yarn) release
docker-compose exec -T www ln -s /app/resources/web /app/public/web
