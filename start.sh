# Detect whether docker is started by commands such as docker images, and redirect the output so that the content will not be output on the console
docker images > /dev/null 2>&1
if [ $? -ne 0 ]; then
  echo ">>>>>>>>Start failure: please start docker first<<<<<<<<"
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

# Pull without password
git config --global credential.helper store
git pull

# Build image
docker build -t ngxway .
if [ $? -ne 0 ]; then
  echo -e ">>>>>>>>Start failure: failed to build<<<<<<<<"
  exit 1
fi

# Mapping to local disk storage
mkdir -p /tmp/logs/ && chmod -R 777 /tmp/logs/

# Run container
docker run --name ngxwayContainer -d -p 127.0.0.1:8090:8090 -v /tmp/logs:/dist/logs/ ngxway
if [ $? -ne 0 ]; then
  echo -e ">>>>>>>>Start failure: failed to run<<<<<<<<"
  exit 1
fi

# Exec command
# docker exec -it ngxwayContainer /bin/sh
docker exec -d ngxwayContainer bash bin/ngxway.sh
if [ $? -ne 0 ]; then
  echo -e ">>>>>>>>Start failure: failed to exec<<<<<<<<"
  exit 1
else
  echo -e "========Start success========"
fi
