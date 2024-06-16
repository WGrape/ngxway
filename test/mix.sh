#!/usr/bin/env bash

# go to the root directory of ngxway.
NGXWAY_BASE_PATH=$(cd `dirname $0`; cd ..; pwd)
cd $NGXWAY_BASE_PATH

# require the common shell scripts.
. $NGXWAY_BASE_PATH/scripts/common.sh

print_which_system
echo -e "=============================="
print_signed_request
