#!/usr/bin/env bash

# Go back to the root directory of ngxway.
ngxwayPath=$(cd `dirname $0`; pwd)
cd $ngxwayPath

# Require the common shell scripts.
. $ngxwayPath/scripts/common.sh

# Check the system, only available for Linux and Unix series.
whichSystem=$(printWhichSystem)

# Export to the global PATH.
if [ "${whichSystem}" == "Linux" ] ; then
  sed -i "/${exportPathTemplate1}/,+2d" ~/.bashrc > /dev/null 2>&1
  source ~/.bashrc > /dev/null 2>&1
else
  sed -i "" "/${exportPathTemplate1}/,+2d" ~/.bash_profile > /dev/null 2>&1
  source ~/.bash_profile > /dev/null 2>&1
fi
# It takes effect temporarily, and it will take effect automatically when you open a new terminal.
$exportPathTemplate2
$exportPathTemplate3
if [ $? -ne 0 ]; then
  echo -e "Warning: failed to update your ngxway command, you may need run this command : source ~/.bashrc or source ~/.bash_profile"
fi
