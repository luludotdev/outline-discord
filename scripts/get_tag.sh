#!/usr/bin/env bash

pushd () {
  command pushd "$@" > /dev/null
}

popd () {
  command popd "$@" > /dev/null
}

pushd outline
echo `git describe --tags $(git rev-list --tags --max-count=1)`
popd
