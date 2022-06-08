#! /bin/bash -e

./gradlew assemble

# Create a container to for print-container-logs.sh

docker run hello-world
