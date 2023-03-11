# install httpd-tools to use ab test,
# docker exec -it ngxwayContainer /bin/bash -c 'mv /etc/yum.repos.d/CentOS-Base.repo /etc/yum.repos.d/CentOS-Base.repo.backup && wget -O /etc/yum.repos.d/CentOS-Base.repo http://mirrors.aliyun.com/repo/Centos-7.repo && yum clean all && yum install -y httpd-tools'
docker exec -it ngxwayContainer /bin/bash -c "sed -e 's|^mirrorlist=|#mirrorlist=|g' \
   -e 's|^#baseurl=http://mirror.centos.org/centos|baseurl=http://mirrors.tuna.tsinghua.edu.cn/centos|g' \
   -i.bak \
   /etc/yum.repos.d/CentOS-*.repo && yum makecache && yum install -y httpd-tools
"

# build go server
docker exec -it ngxwayContainer /bin/bash -c 'cd /dist/example/goserver/ && bash build.sh && cd /'
if [ $? -ne 0 ]; then
  printError "error: failed to build goserver"
  exit 1
fi

# run go server
docker exec -d ngxwayContainer /dist/example/goserver/goserver
if [ $? -ne 0 ]; then
  printError "error: failed to exec goserver"
  exit 1
fi
