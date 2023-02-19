#!/usr/bin/env bash

# Parse the config files.
ngxwayConfigFile="${ngxwayPath}/ngxway.conf"
env=`sed '/^env=/!d;s/.*=//' ${ngxwayConfigFile}`
ngxwayAddr=`sed '/^ngxway_addr=/!d;s/.*=//' ${ngxwayConfigFile}`
localVolumeLogsDir=`sed '/^local_volume_logs_dir=/!d;s/.*=//' ${ngxwayConfigFile}`
slowTime=`sed '/^slow_time=/!d;s/.*=//' ${ngxwayConfigFile}`

# The common variables s here.
# ================================
time=$(date "+%Y-%m-%d %H:%M:%S")

exportPathTemplate1="# Here is the configurations of ngxway"
exportPathTemplate2="export NGXWAY_PATH=${ngxwayPath}"
exportPathTemplate3="export PATH=\$PATH:\$NGXWAY_PATH/bin/"

systemParamTemplate1="ulimit -n 1048576"
# ================================

# The common functions is here.
# ================================
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
# ================================
