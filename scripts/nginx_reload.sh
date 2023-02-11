#!/usr/bin/env bash

dockerenv=$(ls -a /.dockerenv)
if [ "${dockerenv}" != "/.dockerenv" ]; then
  echo "You are not currently in a Docker environment, unable to execute this script." > /dist/logs/nginx.reload.log
  exit 1
fi

# Write start info to ngxway.start.log and fix this bug : https://github.com/WGrape/ngxway/issues/4
cp /dist/conf/nginx/nginx.conf /usr/local/openresty/nginx/conf/
nginx -s reload
if [ $? -ne 0 ]; then
  nginx -s reload > /dist/logs/nginx.reload.log 2>&1
  exit 1
fi

echo "success" > /dist/logs/nginx.reload.log
exit 0
