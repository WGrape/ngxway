#!/usr/bin/env bash

# Include common.sh
. bin/common.sh

# Detect whether docker is started by commands such as docker images, and redirect the output so that the content will not be output on the console
docker images > /dev/null 2>&1
if [ $? -ne 0 ]; then
  echo ">>>>>>>>Start failure: please start docker first<<<<<<<<"
  exit 1
fi

# Handle container
containerCount=0
for file in $(docker container ls -f name=ngxwayContainer -q)
do
    ((containerCount++))
done
if [ $containerCount -ne 0 ]; then
  echo -e ">>>>>>>>Start failure: please run stop.sh first<<<<<<<<"
  exit 1
fi

# Pull without password
git config --global credential.helper store
git pull

# Build image
docker build -t ngxway .
if [ $? -ne 0 ]; then
  echo -e ">>>>>>>>Start failure: failed to build<<<<<<<<"
  exit 1
fi

# Mapping to local disk storage
mkdir -p $local_volume_logs_dir && chmod -R 777 $local_volume_logs_dir

# Run container
docker run --name ngxwayContainer -d -p $ngxway_addr:8090 -v $local_volume_logs_dir:/dist/logs/ ngxway
if [ $? -ne 0 ]; then
  echo -e ">>>>>>>>Start failure: failed to run<<<<<<<<"
  exit 1
fi

# Exec command
# docker exec -it ngxwayContainer /bin/sh
docker exec -d ngxwayContainer bash nginx/reload.sh
if [ $? -ne 0 ]; then
  echo -e ">>>>>>>>Start failure: failed to exec<<<<<<<<"
  exit 1
fi

# The result of command exec in docker
sleep 1 # wait the log of docker sync to local disk
dockerResultMsg=$(cat $local_volume_logs_dir/nginx.reload.log)
if [ "${dockerResultMsg}" != "" ] ; then
  # Write failure log
  log="[${time}] >>>>>>>>failed to reload nginx<<<<<<<<"
  echo $log >> $local_volume_logs_dir/ngxway.start.log
  echo $dockerResultMsg >> $local_volume_logs_dir/ngxway.start.log

  # Output to console
  echo -e $log
  echo -e $dockerResultMsg
  exit 1
else
  # Write success log
  log="[${time}] start ngxway success"
  echo $log >> $local_volume_logs_dir/ngxway.start.log

  # Output to console
  echo -e "========Start success========"
fi

# Try to open it in your chrome if ngxway working in dev mode.
computeSignedRequest
echo -e ""
echo -e "Now, you can visit the url to test : " $signedURL
if [ $env == "dev" ]; then
  open -a "/Applications/Google Chrome.app" $signedURL > /dev/null 2>&1
fi
