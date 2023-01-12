#!/usr/bin/env bash

pushd () {
  command pushd "$@" > /dev/null
}

popd () {
  command popd "$@" > /dev/null
}

# Clone Repo
./scripts/cleanup.sh
git clone https://github.com/outline/outline.git outline

# Get latest tag
LATEST_TAG=`./scripts/get_tag.sh`

# Enter Repo
pushd outline

# Checkout latest tagged version
git checkout "${LATEST_TAG}"

# Apply Patches
git apply ../patches/*.patch

# Merge Dockerfiles
sed -i 's#outlinewiki/outline-base#deps#g' Dockerfile
cat Dockerfile.base Dockerfile > Dockerfile.tmp
mv Dockerfile.tmp Dockerfile

# Exit Repo
popd
