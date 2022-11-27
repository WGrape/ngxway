FROM openresty/openresty:centos

# If you failed to install phpkafka, you can use the lvsid/phpkafka:v1.0 in dockerhub: https://hub.docker.com/repository/docker/lvsid/phpkafka
# FROM lvsid/phpkafka:v1.0

WORKDIR /dist
COPY . /dist/

