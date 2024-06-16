#!/usr/bin/env bash

# go to the root directory of ngxway.
NGXWAY_BASE_PATH=$(cd `dirname $0`; pwd)
cd $NGXWAY_BASE_PATH

# require the common shell scripts.
. $NGXWAY_BASE_PATH/scripts/common.sh

# check the system, only available for Linux and Unix series.
which_system=$(print_which_system)

print_success "remove success"
