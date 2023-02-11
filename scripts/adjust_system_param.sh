# Go back to the root directory of ngxway.
ngxwayPath=$(cd `dirname $0`; cd ..; pwd)
cd $ngxwayPath

# Require the common shell scripts.
. $ngxwayPath/scripts/common.sh

# Adjust system parameters to improve the performance of ngxway.
if [ "${whichSystem}" == "Linux" ] ; then
  echo $systemParamTemplate1 >> ~/.bashrc
  echo $systemParamTemplate2 >> ~/.bashrc
  source ~/.bashrc
else
  echo $systemParamTemplate1 >> ~/.bash_profile
  echo $systemParamTemplate2 >> ~/.bash_profile
  source ~/.bash_profile
fi
