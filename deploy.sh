#!/bin/bash

set -e
GITHUBB_TOKEN=${GITHUBB_TOKEN:-""}

echo "Printing github token ${GITHUBB_TOKEN}"

docker login -u "${QUAY_IO_USERNAME}" -p "${GITHUBB_TOKEN}" quay.io

git clone https://github.com/ceph/csi-charts

echo "done with cloning"
git config user.name ${GITHUB_USERNAME}
git config user.email ${GITHUB_EMAIL}
git config -l
git add --all :/ && git commit -m "Update for helm charts"
echo "done with committing"
git push https://"${GITHUB_TOKEN}"@github.com/ceph/csi-charts
echo "done with pushing"
