cp /dist/vhosts/* /etc/nginx/conf.d/
cp /dist/conf/* /usr/local/openresty/nginx/conf/
nginx -s reload

# Write start info to ngxway.start.log and fix this bug : https://github.com/WGrape/ngxway/issues/4
time=$(date "+%Y-%m-%d %H:%M:%S")
if [ $? -ne 0 ]; then
    log="[${time}] >>>>>>>>failed to start ngxway<<<<<<<<"
    echo -e $log
    echo $log >> /dist/logs/ngxway.start.log
    exit 1
else
    log="[${time}] start ngxway success"
    echo -e $log
    echo $log >> /dist/logs/ngxway.start.log
fi
