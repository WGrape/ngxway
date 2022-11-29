cp /dist/vhosts/* /etc/nginx/conf.d/
cp /dist/conf/* /usr/local/openresty/nginx/conf/
nginx -s reload
