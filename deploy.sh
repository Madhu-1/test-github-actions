#!/bin/bash

set -e
GITHUB_TOKEN=${GITHUB_TOKEN:-""}

echo "Printing github token ${GITHUB_TOKEN}"

docker login -u "${QUAY_IO_USERNAME}" -p "${GITHUB_TOKEN}" quay.io

git clone https://github.com/ceph/csi-charts

echo "done with cloning"
git config user.name ceph-csi-bot
git config user.email ceph-csi-bot@redhat.com
git add --all :/ && git commit -m "Update for helm charts"
echo "done with committing"
git push https://"${GITHUB_TOKEN}"@github.com/ceph/csi-charts
echo "done with pushing"
