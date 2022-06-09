#! /bin/bash -e

source "/home/circleci/.sdkman/bin/sdkman-init.sh"

$MAVEN_CACHE_COMMAND

$GRADLE_CACHE_COMMAND
