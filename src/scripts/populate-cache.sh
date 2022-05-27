#! /bin/bash -e

source "/home/circleci/.sdkman/bin/sdkman-init.sh"

./gradlew testClasses

$MAVEN_CACHE_COMMAND
