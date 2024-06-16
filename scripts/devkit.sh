#!/usr/bin/env bash

# go to the root directory of ngxway.
NGXWAY_BASE_PATH=$(cd `dirname $0`; cd ..; pwd)
cd $NGXWAY_BASE_PATH

# require the common shell scripts.
. $NGXWAY_BASE_PATH/scripts/common.sh

# install httpd-tools to use ab test,
# docker exec -it ngxway_container /bin/bash -c 'mv /etc/yum.repos.d/CentOS-Base.repo /etc/yum.repos.d/CentOS-Base.repo.backup && wget -O /etc/yum.repos.d/CentOS-Base.repo http://mirrors.aliyun.com/repo/Centos-7.repo && yum clean all && yum install -y httpd-tools'
docker exec -it ngxway_container /bin/bash -c "sed -e 's|^mirrorlist=|#mirrorlist=|g' \
   -e 's|^#baseurl=http://mirror.centos.org/centos|baseurl=http://mirrors.tuna.tsinghua.edu.cn/centos|g' \
   -i.bak \
   /etc/yum.repos.d/CentOS-*.repo && yum makecache && yum install -y httpd-tools
"

# build go server
docker exec -it ngxway_container /bin/bash -c 'cd /dist/example/goserver/ && bash build.sh && cd /'
if [ $? -ne 0 ]; then
  print_error "error: failed to build goserver"
  exit 1
fi

# run go server
docker exec -d ngxway_container /dist/example/goserver/goserver
if [ $? -ne 0 ]; then
  print_error "error: failed to exec goserver"
  exit 1
fi
