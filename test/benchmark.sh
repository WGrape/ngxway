# wrk -t 13 -c 1000 -d 30s 'http://127.0.0.1:8090/api/test?sign=2b5f453e8c5db94a12&timestamp=1675582136'
# ab -n 70000 -c 15 -k "http://127.0.0.1:8090/api/test?sign=2b5f453e8c5db94a12&timestamp=1675582136"

currentDir=$(pwd)
. $currentDir/bin/common.sh

computeSignedAPI
echo -e ">> Benchmark command : ab -n 50000 -c 15 -k \"${signedAPI}\""
echo -e
ab -n 50000 -c 15 -k "${signedAPI}"
