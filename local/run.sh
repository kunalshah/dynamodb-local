#!/bin/bash

# exit when any command fails
set -e

# get the absolute path to the root folder of git repo
export REPO_ROOT=`git rev-parse --show-toplevel`
cd $REPO_ROOT/local/

# check if dynamodb_local_latest folder exists in current directory
if [ ! -d "dynamodb_local_latest" ]
then
    echo 'Dyanmodb local is not pre-downloaded'
    echo 'Processing download of Dyanmodb local...'
    echo
    sh download.sh
fi

echo
echo '***** Running dynamodb locally (without docker container) *****'
echo

cd dynamodb_local_latest

echo `***** data will be stored in $REPO_ROOT/local/shared-instance.db *****`

java -Djava.library.path=./DynamoDBLocal_lib -jar ./DynamoDBLocal.jar \
-cors * \
-port 8000 \
-dbPath $REPO_ROOT/local \
-sharedDb \
-optimizeDbBeforeStartup
