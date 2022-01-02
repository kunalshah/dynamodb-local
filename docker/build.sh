#!/bin/bash

# exit when any command fails
set -e

# get the absolute path to the root folder of git repo
export REPO_ROOT=`git rev-parse --show-toplevel`
cd $REPO_ROOT

# start docker build
docker build -f dockerfile -t dynamodb-local .
