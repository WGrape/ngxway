# this will pull lastest version
# https://hub.docker.com/r/openresty/openresty/tags?page=1&name=centos
# FROM openresty/openresty:centos
# FROM --platform=linux/amd64 openresty/openresty:1.21.4.1-4-centos7
FROM --platform=linux/amd64 openresty/openresty:1.21.4.1-4-centos7

# not ENV TZ "Asia/Shanghai"
ENV TZ Asia/Shanghai

# configure the mirror of yum.
# https://mirrors.163.com/.help/centos.html
RUN wget https://mirrors.163.com/.help/CentOS7-Base-163.repo \
    && mv /etc/yum.repos.d/CentOS-Base.repo /etc/yum.repos.d/CentOS-Base.repo.backup \
    && mv CentOS7-Base-163.repo /etc/yum.repos.d/CentOS7-Base-163.repo \
    && yum clean all && yum makecache

# install the crontab and logrotate for log rotating.
RUN yum -y install logrotate crontabs
COPY ./conf/logrotate/logrotate.conf /etc/logrotate.d

WORKDIR /dist
COPY . /dist/
