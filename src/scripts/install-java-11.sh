#! /bin/bash -e

export SDKMAN_DIR=/home/circleci/.sdkman

max_retries=5

for i in $(seq 1 $max_retries); do
  echo "Attempt #$i of $max_retries:"
  (curl -s "https://get.sdkman.io" | bash) && break || echo "Failed. Retrying..."

  if [ $i -eq $max_retries ]; then
    echo "All attempts failed. Exiting."
    exit 1
  fi
  sleep 3
done

source "/home/circleci/.sdkman/bin/sdkman-init.sh"
sdk install java "$(sdk list java | grep -E  " ${JAVA_VERSION_TO_INSTALL}[0-9.]*-zulu" | head -1 | cut -f6 -d\| | awk '{$1=$1;print}')"
