#!/usr/bin/env bash

# Go back to the root directory of ngxway.
ngxwayPath=$(cd `dirname $0`; pwd)
cd $ngxwayPath

# Require the common shell scripts.
. $ngxwayPath/scripts/common.sh

# Check the system, only available for Linux and Unix series.
whichSystem=$(printWhichSystem)

# Export to the global PATH.
if [ $whichSystem == "Linux" ];then
  sed "/${exportPathTemplate1}/,+2d" ~/.bashrc
  source ~/.bashrc
else
  sed -i "" "/${exportPathTemplate1}/,+2d" ~/.bash_profile
  source ~/.bash_profile
fi
