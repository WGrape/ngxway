#!/usr/bin/env bash

# parse the config files.
ngxway_config_file="${NGXWAY_BASE_PATH}/ngxway.conf"
env=`sed '/^env=/!d;s/\([^#]*\)#.*$/\1/;s/.*=//' ${ngxway_config_file}`
ngxway_addr=`sed '/^ngxway_addr=/!d;s/\([^#]*\)#.*$/\1/;s/.*=//' ${ngxway_config_file}`
local_volume_logs_dir=`sed '/^local_volume_logs_dir=/!d;s/\([^#]*\)#.*$/\1/;s/.*=//' ${ngxway_config_file}`
ext_enable=`sed '/^ext_enable=/!d;s/\([^#]*\)#.*$/\1/;s/.*=//' ${ngxway_config_file}`
slow_time=`sed '/^slow_time=/!d;s/\([^#]*\)#.*$/\1/;s/.*=//' ${ngxway_config_file}`
max_n_cpu=`sed '/^max_ncpu=/!d;s/\([^#]*\)#.*$/\1/;s/.*=//' ${ngxway_config_file}`
docker_network=`sed '/^docker_network=/!d;s/\([^#]*\)#.*$/\1/;s/.*=//' ${ngxway_config_file}`
tcp_syncookies=`sed '/^tcp_syncookies=/!d;s/\([^#]*\)#.*$/\1/;s/.*=//' ${ngxway_config_file}`
tcp_max_tw_buckets=`sed '/^tcp_max_tw_buckets=/!d;s/\([^#]*\)#.*$/\1/;s/.*=//' ${ngxway_config_file}`
tcp_tw_reuse=`sed '/^tcp_tw_reuse=/!d;s/\([^#]*\)#.*$/\1/;s/.*=//' ${ngxway_config_file}`
so_max_conn=`sed '/^somaxconn=/!d;s/\([^#]*\)#.*$/\1/;s/.*=//' ${ngxway_config_file}`
ip_local_port_range=`sed '/^ip_local_port_range=/!d;s/\([^#]*\)#.*$/\1/;s/.*=//' ${ngxway_config_file}`
soft_no_file=`sed '/^soft_nofile=/!d;s/\([^#]*\)#.*$/\1/;s/.*=//' ${ngxway_config_file}`
hard_no_file=`sed '/^hard_nofile=/!d;s/\([^#]*\)#.*$/\1/;s/.*=//' ${ngxway_config_file}`

if [ "$local_volume_logs_dir" == "" ] || [ "$local_volume_logs_dir" == "\"\"" ] ; then
  local_volume_logs_dir="${NGXWAY_BASE_PATH}/logs"
fi
if [ "$docker_network" == "" ]; then
  docker_network="bridge"
fi

# the common variables s here.
# ================================
time=$(date "+%Y-%m-%d %H:%M:%S")
logo_text='
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
apache_bench_temp_file="${NGXWAY_BASE_PATH}/logs/apachebench.temp"
benchmark_temp_html_file="${NGXWAY_BASE_PATH}/logs/benchmark.temp.html"
benchmark_template_file="${NGXWAY_BASE_PATH}/logs/benchmark.template"
benchmark_html_file="${NGXWAY_BASE_PATH}/logs/benchmark.html"
# ================================

# the common functions is here.
# ================================
function check_ngxway_config() {
  if [ "$docker_network" == "bridge" ] || [ "$docker_network" == "host" ] ;then
    echo "ok"
    return
  fi

  echo "failed"
}

function compute_signed_request() {
  timeStamp=`date +%s`

  (( length=timeStamp%16+10 ))

  secret="ngxway"
  sign="${timeStamp}_${secret}_${timeStamp}"

  which_system=$(print_which_system)
  if [ $which_system == "Linux" ] ; then
    signMd5=`echo -n ${sign} | md5sum | cut -d ' ' -f1`
  else
    signMd5=`md5 -s ${sign} | awk '{ print $4 }'`
  fi

  result=${signMd5: 0: $length}

  signedURL="http://${ngxway_addr}/"
  signedAPI="http://${ngxway_addr}/api/test?sign=${result}&timestamp=${timeStamp}"
}

function is_ngxway_running(){
  compute_signed_request
  http_code=$(curl -I -m 10 -o /dev/null -s -w %{http_code} $signedURL)
  if [ $http_code == "200" ]; then
    echo "yes"
  else
    echo "no"
  fi
}

function run_benchmark_test(){
  if [ "$1" == "" ] ||  [ "$2" == "" ] ; then
    return
  fi

  count=0
  while [ $count -lt 10 ]
  do
    count=$((count+1))

    # you can use the following commands to test the QPS of ngxway.
    # bash test/benchmark.sh
    # bash test/benchmark.sh url
    # bash test/benchmark.sh api
    command="ab -r $1 -k $2"
    echo -e $command
    $command > $apache_bench_temp_file
    if [ $? -ne 0 ]; then
      print_error "error: failed / count=${count}"
      sleep 1
    else
      print_success "complete / count=${count}"
      return 0
    fi
  done

  return 1
}

function print_cpu_memory() {
  cpu_cores=$(grep -c ^processor /proc/cpuinfo 2>/dev/null || sysctl -n hw.ncpu)

  if [[ "$OSTYPE" == "darwin"* ]]; then
      # Mac
      mem_size_gb=$(sysctl -a | grep 'hw.memsize' | awk '{print $2}')
      mem_size_gb=$((mem_size_gb/1024/1024/1024))
  else
      # Linux
      mem_size_gb=$(free -m | awk '/Mem/{print $2}')
      mem_size_gb=$((mem_size_gb/1024))
  fi

  echo "${cpu_cores}C${mem_size_gb}G"
}

function print_signed_request() {
  compute_signed_request
  echo "timeStamp=$timeStamp"
  echo "length=$length"
  echo "sign=$sign"
  echo "signMd5=$signMd5"
  echo "result = " $result
  echo "url = " $signedURL
  echo "api = " $signedAPI
}

function print_which_system(){
  uNames=`uname -s`
  osName=${uNames: 0: 4}
  if [ "$osName" == "Darw" ] ; then # Darwin
    which_system="MacOS"
  elif [ "$osName" == "Linu" ] ; then # Linux
    which_system="Linux"
  elif [ "$osName" == "MING" ] ; then # MINGW
    which_system="Windows"
  else
    which_system="Unknown"
  fi
  echo $which_system
}

function print_success(){
  if [ "$1" == "" ]; then
    echo $1
    return
  fi

  which_system=$(print_which_system)
  if [ $which_system == "Linux" ] ; then
    echo -e "\e[32m$1\e[0m"
  else
    echo -e "\033[32m$1\033[0m"
  fi
}

function print_error(){
  if [ "$1" == "" ]; then
    echo $1
    return
  fi

  which_system=$(print_which_system)
  if [ $which_system == "Linux" ] ; then
    echo -e "\e[31m>>>>>>>> $1 <<<<<<<<\e[0m"
  else
    echo -e "\033[31m>>>>>>>> $1 <<<<<<<<\033[0m"
  fi
}

function print_info(){
  if [ "$1" == "" ]; then
    echo $1
    return
  fi

  which_system=$(print_which_system)
  if [ $which_system == "Linux" ] ; then
    echo -e "\e[33m======== $1 ========\e[0m"
  else
    echo -e "\033[33m======== $1 ========\033[0m"
  fi
}

function print_logo(){
  echo -e "$logo_text"
}
# ================================
