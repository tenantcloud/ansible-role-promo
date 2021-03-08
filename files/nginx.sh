#!/usr/bin/env bash

echo "We will be using local nginx as a proxy to make HTTPS requests"

echo "Copy ssl certificates for tc.loc domain"

cp -r docs/installation/ssl/tc.loc.* /usr/local/etc/nginx/ssl

echo "Copy nginx virtual host config file"

cp -r docker/proxy/conf.d/tc_www.conf /usr/local/etc/nginx/servers

echo "Add *.tc.loc domains in /etc/hosts"

if ! grep -q "127.0.0.1 tc.loc" \
/etc/hosts; then
  echo "127.0.0.1 tc.loc www.tc.loc minio-www.tc.loc supervisor-www.tc.loc" \
  | sudo tee -a /etc/hosts
fi

echo "Restart local nginx server"

sudo brew services restart nginx

echo "That's all!"
echo "Have a nice day!"
