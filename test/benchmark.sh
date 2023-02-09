#!/usr/bin/env bash

currentDir=$(pwd)
. $currentDir/bin/common.sh

computeSignedRequest
addrUrl=${signedURL}
if [ -n "$1" ] && [ "$1" == "api" ]; then
  addrUrl=${signedAPI}
fi

# You can use the following commands to test the QPS of ngxway.
# bash test/benchmark.sh
# bash test/benchmark.sh url
# bash test/benchmark.sh api
command="ab -r -n 100000 -c 500 -k ${addrUrl}"
echo -e $command
echo -e
${command}
