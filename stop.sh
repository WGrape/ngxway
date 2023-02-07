#!/usr/bin/env bash

# Include common.sh
. bin/common.sh

# Stop and remove container
docker stop ngxwayContainer
if [ $? -ne 0 ]; then
  echo ">>>>>>>>Stop failure: please start docker first<<<<<<<<"
  exit 1
fi

docker container rm ngxwayContainer
if [ $? -ne 0 ]; then
  echo ">>>>>>>>Stop failure: failed to rm container<<<<<<<<"
  exit 1
fi

# Remove image
docker rmi ngxway
if [ $? -ne 0 ]; then
  echo ">>>>>>>>Stop failure: failed to rm image<<<<<<<<"
  exit 1
fi

# Remove local volume logs
rm -rf $local_volume_logs_dir

echo -e "========Stop success========"