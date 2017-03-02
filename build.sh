#!/bin/bash -ex

export LAMBCI_REPO="mwobensmith/ssl_compat"
export ORIGIN_BUCKET="limed-test-stage"

rm -rf /tmp/${LAMBCI_REPO}
git clone --depth 1 https://github.com/${LAMBCI_REPO} /tmp/${LAMBCI_REPO}
cd /tmp/${LAMBCI_REPO}

aws s3 sync  /tmp/${LAMBCI_REPO} s3://${ORIGIN_BUCKET} --delete --exclude ".git/*"
