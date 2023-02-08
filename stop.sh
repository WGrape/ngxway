#!/usr/bin/env bash

# Include common.sh
. bin/common.sh

# Detect whether docker is started by commands such as docker images, and redirect the output so that the content will not be output on the console
docker images > /dev/null 2>&1
if [ $? -ne 0 ]; then
  echo ">>>>>>>>Stop failure: please start docker first<<<<<<<<"
  exit 1
fi

# Stop and remove container
docker stop ngxwayContainer
docker container rm ngxwayContainer

# Remove image
docker rmi ngxway

# Remove local volume logs
rm -rf $local_volume_logs_dir

echo -e "========Stop success========"
