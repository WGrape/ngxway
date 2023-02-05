#!/usr/bin/env bash

currentDir=$(pwd)
. $currentDir/bin/common.sh

computeSignedRequest

# test the api
echo -e ">> Benchmark command : ab -n 50000 -c 15 -k \"${signedAPI}\""
echo -e
ab -n 50000 -c 15 -k "${signedAPI}"
