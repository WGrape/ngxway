# The configuration of ngxway is here.
# ================================
local_volume_logs_dir="/tmp/logs" # the log dir mapping to your local volume
ngxway_addr="127.0.0.1:8090" # the address and port of ngxway
env="dev" # only dev/test/gray/prod four environments
# ================================


# The common functions of ngxway is here.
# ================================
function computeSignedAPI() {
  timeStamp=`date +%s`

  (( length=timeStamp%16+10 ))

  secret="ngxway"
  sign="${timeStamp}_${secret}_${timeStamp}"

  signMd5=`md5 -s ${sign} | awk '{ print $4 }'`

  result=${signMd5: 0: $length}

  signedAPI="http://${ngxway_addr}?sign=${result}&timestamp=${timeStamp}"
}

function printSignedAPI() {
  computeSignedAPI
  echo "timeStamp=$timeStamp"
  echo "length=$length"
  echo "sign=$sign"
  echo "signMd5=$signMd5"
  echo "result = " $result
  echo "url = " $signedAPI
}

function printWhichSystem(){
  uNames=`uname -s`
  osName=${uNames: 0: 4}
  if [ "$osName" == "Darw" ] ; then # Darwin
    echo "MacOS"
  elif [ "$osName" == "Linu" ] ; then # Linux
    echo "GNU/Linux"
  elif [ "$osName" == "MING" ] ; then # MINGW, windows, git-bash
    echo "Windows"
  else
    echo "Unknown"
  fi
}
# ================================