#!/usr/bin/env bash

# Go back to the root directory of ngxway.
ngxwayPath=$(cd `dirname $0`; pwd)
cd $ngxwayPath

# Require the common shell scripts.
. $ngxwayPath/scripts/common.sh

# Check the system, only available for Linux and Unix series.
whichSystem=$(printWhichSystem)

printSuccess "remove success"
