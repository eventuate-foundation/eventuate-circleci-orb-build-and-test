#! /bin/bash -e

mkdir -p ~/junit
find . -type f -regex ".*/build/test-results/.*xml" -exec cp {} ~/junit/ \;
