docker stop nginxContainer
docker container rm nginxContainer
docker run --name nginxContainer -p 8010:80 -d nginx
