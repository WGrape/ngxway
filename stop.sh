#!/usr/bin/env bash

# Stop and remove container
docker stop ngxwayContainer
docker container rm ngxwayContainer

# Remove image
docker rmi ngxway

if [ $? -ne 0 ]; then
  echo -e ">>>>>>>>Stop failure<<<<<<<<"
  exit 1
else
  echo -e "========Stop success========"
fi