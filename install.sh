#!/usr/bin/env bash

. bin/common.sh

# Check the system, only available for Linux and Unix series.
whichSystem=$(printWhichSystem)
if [ $whichSystem == "Windows" ] || [ $whichSystem == "Unknown" ]; then
  echo "Sorry, you can't install ngxway in your system, ngxway is only available for Linux and Unix series."
  exit 1
fi

# Check if docker is installed
docker info  > /dev/null 2>&1
if [ $? -ne 0 ]; then
  echo -e ">>>>>>>>Install failure: please install or start docker first<<<<<<<<"
  echo -e "see more detail about ngxway(https://github.com/WGrape/ngxway) and docker document(https://docs.docker.com/engine/install/)"
  exit 1
fi

# Check the image

# Print message about how to launch
# open -a "/Applications/Google Chrome.app" https://github.com/WGrape/ngxway
echo -e "install successfully !"
echo -e "Now, you just run start.sh and will launch it"

