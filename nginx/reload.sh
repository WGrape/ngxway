#!/usr/bin/env bash

# Write start info to ngxway.start.log and fix this bug : https://github.com/WGrape/ngxway/issues/4
cp /dist/nginx/conf/* /usr/local/openresty/nginx/conf/
nginx -s reload
if [ $? -ne 0 ]; then
  nginx -s reload > /dist/logs/nginx.reload.log 2>&1
  exit 1
fi

echo "success" > /dist/logs/nginx.reload.log
exit 0
