#!/usr/bin/env bash

# shellcheck disable=SC1090

# Added path to 'tcctl' in PATH variable
cd "$(dirname "$0")"/../../ || exit
PATH=$(pwd)/cli:$PATH

DOCKER_APP_NAME="app"

docker-compose exec -T "${DOCKER_APP_NAME}" composer install --no-interaction --prefer-dist --optimize-autoloader
docker run --rm -i --network=tc-www-network --mount source=tc-www-nfsmount,target=/app \
  -w /app --entrypoint "/app/sh/install/minio.sh"  minio/mc:latest
$(command -v yarn) ci
$(command -v yarn) release
docker-compose exec -T "${DOCKER_APP_NAME}" ln -s /app/resources/web /app/public/web
