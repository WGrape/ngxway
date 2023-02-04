#!/usr/bin/env bash

# Include common.sh
. bin/common.sh

# Stop and remove container
docker stop ngxwayContainer
docker container rm ngxwayContainer

# Remove image
docker rmi ngxway

# Remove local volume logs
rm -rf $local_volume_logs_dir

if [ $? -ne 0 ]; then
  echo -e ">>>>>>>>Stop failure<<<<<<<<"
  exit 1
else
  echo -e "========Stop success========"
fi