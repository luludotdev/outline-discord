#!/usr/bin/env bash

# Clone Repo
rm -rf outline
git clone https://github.com/outline/outline.git outline

# Enter Repo
pushd outline

# Checkout latest tagged version
LATEST_TAG=`git describe --tags --abbrev=0`
git checkout "${LATEST_TAG}"

# Apply Patches
git apply ../patches/*.patch

# Exit Repo
popd
