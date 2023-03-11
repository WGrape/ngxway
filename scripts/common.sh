#!/usr/bin/env bash

# Parse the config files.
ngxwayConfigFile="${ngxwayPath}/ngxway.conf"
env=`sed '/^env=/!d;s/.*=//' ${ngxwayConfigFile}`
ngxwayAddr=`sed '/^ngxway_addr=/!d;s/.*=//' ${ngxwayConfigFile}`
localVolumeLogsDir=`sed '/^local_volume_logs_dir=/!d;s/.*=//' ${ngxwayConfigFile}`
extEnable=`sed '/^ext_enable=/!d;s/.*=//' ${ngxwayConfigFile}`
slowTime=`sed '/^slow_time=/!d;s/.*=//' ${ngxwayConfigFile}`
maxNCPU=`sed '/^max_ncpu=/!d;s/.*=//' ${ngxwayConfigFile}`
dockerNetwork=`sed '/^docker_network=/!d;s/.*=//' ${ngxwayConfigFile}`
tcpSyncookies=`sed '/^tcp_syncookies=/!d;s/.*=//' ${ngxwayConfigFile}`
tcpMaxTWBuckets=`sed '/^tcp_max_tw_buckets=/!d;s/.*=//' ${ngxwayConfigFile}`
tcpTWReuse=`sed '/^tcp_tw_reuse=/!d;s/.*=//' ${ngxwayConfigFile}`
soMaxConn=`sed '/^somaxconn=/!d;s/.*=//' ${ngxwayConfigFile}`
ipLocalPortRange=`sed '/^ip_local_port_range=/!d;s/.*=//' ${ngxwayConfigFile}`
softNoFile=`sed '/^soft_nofile=/!d;s/.*=//' ${ngxwayConfigFile}`
hardNoFile=`sed '/^hard_nofile=/!d;s/.*=//' ${ngxwayConfigFile}`

if [ "$localVolumeLogsDir" == "" ] || [ "$localVolumeLogsDir" == "\"\"" ] ; then
  localVolumeLogsDir="${ngxwayPath}/logs"
fi
if [ "$dockerNetwork" == "" ]; then
  dockerNetwork="bridge"
fi

# The common variables s here.
# ================================
time=$(date "+%Y-%m-%d %H:%M:%S")
logoText='
 _______    ______   __    __  __   __   __   ______   __    __
/       \  /      \ /  \  /  |/  | /  | /  | /      \ /  |  /  |
$$$$$$$  |/$$$$$$  |$$  \/$$/ $$ | $$ | $$ | $$$$$$  |$$ |  $$ |
$$ |  $$ |$$ |  $$ | $$  $$<  $$ | $$ | $$ | /    $$ |$$ |  $$ |
$$ |  $$ |$$ \__$$ | /$$$$  \ $$ \_$$ \_$$ |/$$$$$$$ |$$ \__$$ |
$$ |  $$ |$$    $$ |/$$/ $$  |$$   $$   $$/ $$    $$ |$$    $$ |
$$/   $$/  $$$$$$$ |$$/   $$/  $$$$$/$$$$/   $$$$$$$/  $$$$$$$ |
          /  \__$$ |                                  /  \__$$ |
          $$    $$/                                   $$    $$/
           $$$$$$/                                     $$$$$$/
'
apacheBenchTempFile="${ngxwayPath}/logs/apachebench.temp"
benchmarkTempHTMLFile="${ngxwayPath}/html/benchmark.temp.html"
benchmarkTemplateFile="${ngxwayPath}/html/benchmark.template"
benchmarkHTMLFile="${ngxwayPath}/html/benchmark.html"
# ================================

# The common functions is here.
# ================================
function checkNgxwayConfig() {
  if [ "$dockerNetwork" == "bridge" ] || [ "$dockerNetwork" == "host" ] ;then
    echo "ok"
    return
  fi

  echo "failed"
}

function computeSignedRequest() {
  timeStamp=`date +%s`

  (( length=timeStamp%16+10 ))

  secret="ngxway"
  sign="${timeStamp}_${secret}_${timeStamp}"

  whichSystem=$(printWhichSystem)
  if [ $whichSystem == "Linux" ] ; then
    signMd5=`echo -n ${sign} | md5sum | cut -d ' ' -f1`
  else
    signMd5=`md5 -s ${sign} | awk '{ print $4 }'`
  fi

  result=${signMd5: 0: $length}

  signedURL="http://${ngxwayAddr}/"
  signedAPI="http://${ngxwayAddr}/api/test?sign=${result}&timestamp=${timeStamp}"
}

function isNgxwayRunning(){
  computeSignedRequest
  httpCode=$(curl -I -m 10 -o /dev/null -s -w %{http_code} $signedURL)
  if [ $httpCode == "200" ]; then
    echo "yes"
  else
    echo "no"
  fi
}

function runBenchmarkTest(){
  if [ "$1" == "" ] ||  [ "$2" == "" ] ; then
    return
  fi

  count=0
  while [ $count -lt 10 ]
  do
    count=$((count+1))

    # You can use the following commands to test the QPS of ngxway.
    # bash test/benchmark.sh
    # bash test/benchmark.sh url
    # bash test/benchmark.sh api
    command="ab -r $1 -k $2"
    echo -e $command
    $command > $apacheBenchTempFile
    if [ $? -ne 0 ]; then
      printError "error: failed / count=${count}"
      sleep 1
    else
      printSuccess "complete / count=${count}"
      return 0
    fi
  done

  return 1
}

function printCPUMemory() {
  cpu_cores=$(grep -c ^processor /proc/cpuinfo 2>/dev/null || sysctl -n hw.ncpu)

  if [[ "$OSTYPE" == "darwin"* ]]; then
      # Mac
      mem_size_gb=$(sysctl -a | grep 'hw.memsize' | awk '{print $2}')
      mem_size_gb=$((mem_size_gb/1024/1024/1024))
  else
      # Linux
      mem_size_gb=$(free -m | awk '/Mem/{print $2}')
  fi

  echo "${cpu_cores}C${mem_size_gb}G"
}

function printSignedRequest() {
  computeSignedRequest
  echo "timeStamp=$timeStamp"
  echo "length=$length"
  echo "sign=$sign"
  echo "signMd5=$signMd5"
  echo "result = " $result
  echo "url = " $signedURL
  echo "api = " $signedAPI
}

function printWhichSystem(){
  uNames=`uname -s`
  osName=${uNames: 0: 4}
  if [ "$osName" == "Darw" ] ; then # Darwin
    whichSystem="MacOS"
  elif [ "$osName" == "Linu" ] ; then # Linux
    whichSystem="Linux"
  elif [ "$osName" == "MING" ] ; then # MINGW
    whichSystem="Windows"
  else
    whichSystem="Unknown"
  fi
  echo $whichSystem
}

function printSuccess(){
  if [ "$1" == "" ]; then
    echo $1
    return
  fi

  whichSystem=$(printWhichSystem)
  if [ $whichSystem == "Linux" ] ; then
    echo -e "\e[32m$1\e[0m"
  else
    echo -e "\033[32m$1\033[0m"
  fi
}

function printError(){
  if [ "$1" == "" ]; then
    echo $1
    return
  fi

  whichSystem=$(printWhichSystem)
  if [ $whichSystem == "Linux" ] ; then
    echo -e "\e[31m>>>>>>>> $1 <<<<<<<<\e[0m"
  else
    echo -e "\033[31m>>>>>>>> $1 <<<<<<<<\033[0m"
  fi
}

function printInfo(){
  if [ "$1" == "" ]; then
    echo $1
    return
  fi

  whichSystem=$(printWhichSystem)
  if [ $whichSystem == "Linux" ] ; then
    echo -e "\e[33m======== $1 ========\e[0m"
  else
    echo -e "\033[33m======== $1 ========\033[0m"
  fi
}

function printLogo(){
  echo -e "$logoText"
}
# ================================
