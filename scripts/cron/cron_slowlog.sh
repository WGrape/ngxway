# Go back to the root directory of ngxway.
ngxwayPath=$(cd `dirname $0`; cd ../../; pwd)
cd $ngxwayPath

# Require the common shell scripts.
. $ngxwayPath/scripts/common.sh

cd $localVolumeLogsDir

# cat ngxway.access.log | awk '{print $6}' | sort | tail -n 10
cat ngxway.access.log | awk '$6>'$slowTime'{print $0}' > ngxway.slow.log
