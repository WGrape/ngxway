#!/usr/bin/env bash

currentDir=$(pwd)
. $currentDir/bin/common.sh

computeSignedRequest
addrUrl=${signedURL}
if [ $1 == "api" ]; then
  addrUrl=${signedAPI}
fi

# You can use the following commands to test the QPS of ngxway.
# bash test/benchmark.sh
# bash test/benchmark.sh url
# bash test/benchmark.sh api
command="ab -n 50000 -c 15 -k ${addrUrl}"
echo -e $command
echo -e
${command}
