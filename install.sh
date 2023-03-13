#!/usr/bin/env bash

# Go back to the root directory of ngxway.
ngxwayPath=$(cd `dirname $0`; pwd)
cd $ngxwayPath

# Require the common shell scripts.
. $ngxwayPath/scripts/common.sh

# Check the system, only available for Linux and Unix series.
whichSystem=$(printWhichSystem)
if [ "$whichSystem" == "Windows" ] || [ "$whichSystem" == "Unknown" ]; then
  printError "error: you can't install ngxway in your system, ngxway is only available for Linux and Unix series."
  exit 1
fi

# Check if docker is installed.
docker info  > /dev/null 2>&1
if [ $? -ne 0 ]; then
  printError "error: please install or start docker first"
  printInfo "see more detail about exceptions: https://github.com/WGrape/ngxway"
  exit 1
fi

# Chmod the executable files.
chmod a+x $ngxwayPath/bin/ngxway
chmod a+x $ngxwayPath/bin/ngxway_benchmark

# Check the ab is installed.
if ! command -v ab &> /dev/null; then
  echo -e "Warning: You don't have ab installed on your current machine. If you need to run the bin/ngxway_benchmark script on this machine, please remember to install it."
fi

# Print success message.
printSuccess "install successfully !"
printInfo "let's start it with command: bash bin/ngxway restart"
