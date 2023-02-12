#!/usr/bin/env bash

# Go back to the root directory of ngxway.
ngxwayPath=$(cd `dirname $0`; pwd)
cd $ngxwayPath

# Require the common shell scripts.
. $ngxwayPath/scripts/common.sh

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

# Chmod the executable files.
chmod a+x $ngxwayPath/bin/ngxway
chmod a+x $ngxwayPath/bin/ngxway_benchmark

# Export to the global PATH.
if [ "${whichSystem}" == "Linux" ]; then
  echo $exportPathTemplate1 >> ~/.bashrc
  echo $exportPathTemplate2 >> ~/.bashrc
  echo $exportPathTemplate3 >> ~/.bashrc
  source ~/.bashrc && . ~/.bashrc
else
  echo $exportPathTemplate1 >> ~/.bash_profile
  echo $exportPathTemplate2 >> ~/.bash_profile
  echo $exportPathTemplate3 >> ~/.bash_profile
  source ~/.bash_profile
fi
if [ $? -ne 0 ]; then
  echo -e "Warning: failed to update your ngxway command, you may need run this command : source ~/.bashrc or source ~/.bash_profile"
fi

# Print message about how to launch
# open -a "/Applications/Google Chrome.app" https://github.com/WGrape/ngxway
echo -e "install successfully !"
echo -e "Now, you just run ==> ngxway start <== and will launch it"
