# Go back to the root directory of ngxway.
ngxwayPath=$(cd `dirname $0`; cd ..; pwd)
cd $ngxwayPath

# Require the common shell scripts.
. $ngxwayPath/scripts/common.sh

cd $localVolumeLogsDir
tail -n 1000 ngxway.error.log
