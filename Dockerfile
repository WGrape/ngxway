# FROM openresty/openresty:centos # this will pull lastest version
# https://hub.docker.com/r/openresty/openresty/tags?page=1&name=centos
FROM openresty/openresty:1.21.4.1-centos

# not ENV TZ "Asia/Shanghai"
ENV TZ Asia/Shanghai

WORKDIR /dist
COPY . /dist/
