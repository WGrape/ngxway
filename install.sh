#!/usr/bin/env bash

# go to the root directory of ngxway.
NGXWAY_BASE_PATH=$(cd `dirname $0`; pwd)
cd $NGXWAY_BASE_PATH

# require the common shell scripts.
. $NGXWAY_BASE_PATH/scripts/common.sh

# check the system, only available for Linux and Unix series.
which_system=$(print_which_system)
if [ "$which_system" == "Windows" ] || [ "$which_system" == "Unknown" ]; then
  print_error "error: you can't install ngxway in your system, ngxway is only available for Linux and Unix series."
  exit 1
fi

# check if docker is installed.
docker info  > /dev/null 2>&1
if [ $? -ne 0 ]; then
  print_error "error: please install or start docker first"
  print_info "see more detail about exceptions: https://github.com/WGrape/ngxway"
  exit 1
fi

# chmod the executable files.
chmod a+x $NGXWAY_BASE_PATH/bin/ngxway
chmod a+x $NGXWAY_BASE_PATH/bin/ngxway_benchmark

# check the ab is installed.
if ! command -v ab &> /dev/null; then
  echo -e "Warning: You don't have ab installed on your current machine. If you need to run the bin/ngxway_benchmark script on this machine, please remember to install it."
fi

# print success message.
print_success "install successfully !"
print_info "let's start it with command: bash bin/ngxway restart"
