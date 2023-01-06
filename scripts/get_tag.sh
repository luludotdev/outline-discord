#!/usr/bin/env bash

pushd () {
  command pushd "$@" > /dev/null
}

popd () {
  command popd "$@" > /dev/null
}

# TODO: Remove hardcoded version
echo "v0.66.3"

# pushd outline
# echo `git describe --tags $(git rev-list --tags --max-count=1)`
# popd
