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

JAVA_IDENTIFIER_TO_INSTALL="$(sdk list java | grep -E " ${JAVA_VERSION_TO_INSTALL}[0-9.]*-amzn" | head -1 | sed -e 's/.*| *//')"

if [ -z "${JAVA_IDENTIFIER_TO_INSTALL}" ]; then
  echo "Cannot find an -amzn Java version matching '${JAVA_VERSION_TO_INSTALL}' in 'sdk list java'" >&2
  exit 1
fi

echo "Installing Java ${JAVA_IDENTIFIER_TO_INSTALL}"

sdk install java "${JAVA_IDENTIFIER_TO_INSTALL}"
