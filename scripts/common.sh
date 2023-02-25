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
