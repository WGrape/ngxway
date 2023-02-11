# this will pull lastest version
# https://hub.docker.com/r/openresty/openresty/tags?page=1&name=centos
# FROM openresty/openresty:centos
# FROM --platform=linux/amd64 openresty/openresty:1.21.4.1-4-centos7
FROM --platform=linux/amd64 openresty/openresty:1.21.4.1-4-centos7

# not ENV TZ "Asia/Shanghai"
ENV TZ Asia/Shanghai

WORKDIR /dist
COPY . /dist/
