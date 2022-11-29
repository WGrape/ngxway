FROM openresty/openresty:centos

# not ENV TZ "Asia/Shanghai"
ENV TZ Asia/Shanghai

WORKDIR /dist
COPY . /dist/
