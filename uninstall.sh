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

echo -e "You have uninstalled ngxway successfully."
