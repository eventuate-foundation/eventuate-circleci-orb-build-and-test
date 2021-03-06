#! /bin/bash -e

export SDKMAN_DIR=/home/circleci/.sdkman

curl -s "https://get.sdkman.io" | bash
source "/home/circleci/.sdkman/bin/sdkman-init.sh"
sdk install java "$(sdk list java | grep -E  ' 11.*zulu' | head -1 | cut -f6 -d\| | awk '{$1=$1;print}')"
