docker stop openrestyContainer
docker container rm openrestyContainer
docker run --name openrestyContainer -p 8011:80 -d openresty/openresty
