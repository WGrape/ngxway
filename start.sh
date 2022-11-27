# Build image
docker build -t ngxway .
if [ $? -ne 0 ]; then
  echo -e ">>>>>>>>Start failure: failed to build<<<<<<<<"
  exit 1
fi

# Handle container
containerCount=0
for file in $(docker container ls -f name=ngxwayContainer -q)
do
    ((containerCount++))
done
if [ $containerCount -ne 0 ]; then
  echo -e ">>>>>>>>Start failure: please run stop.sh first<<<<<<<<"
  exit 1
fi

# Run container
docker run --name ngxwayContainer -d -p 127.0.0.1:8090:8090 -v /tmp/logs:/dist/logs/ ngxway
if [ $? -ne 0 ]; then
  echo -e ">>>>>>>>Start failure: failed to run<<<<<<<<"
  exit 1
fi

# Exec command
docker exec -d ngxwayContainer bash bin/init.sh
if [ $? -ne 0 ]; then
  echo -e ">>>>>>>>Start failure: failed to exec<<<<<<<<"
  exit 1
else
  echo -e "========Start success========"
fi
