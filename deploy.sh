#!/bin/bash

set -e
GITHUB_TOKEN=${GITHUB_TOKEN:-""}

echo "Printing github token ${GITHUB_TOKEN}"

docker login -u "${QUAY_IO_USERNAME}" -p "${GITHUB_TOKEN}" quay.io
