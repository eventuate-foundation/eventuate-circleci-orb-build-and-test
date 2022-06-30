#! /bin/bash -e

CONTAINER_IDS=$(docker ps -a -q)

for id in $CONTAINER_IDS ; do
  printf "\n--------------------"
  printf "logs of:\n"
  docker ps -a -f "id=$id"
  printf "\n"
  echo logs "$id"
  printf "\n--------------------\n"
done

mkdir -p ~/container-logs

docker ps -a > ~/container-logs/containers.txt

for name in $(docker ps -a --format "{{.Names}}") ; do
  docker logs "$name" > "$HOME/container-logs/${name}.log"
done

echo IMAGE ARCHITECTURES

for image in $(docker image ls --format '{{.Repository}}:{{.Tag}}' | grep -v none) ; do
  echo "$(docker inspect $image | jq -r '.[0].Architecture')" $image
done