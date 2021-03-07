#!/bin/bash

# exit when any command fails
set -e

# download latest version of dynamodb-local
curl -O https://s3.us-west-2.amazonaws.com/dynamodb-local/dynamodb_local_latest.tar.gz

# check if dynamodb_local_latest folder exists in current directory
if [ ! -d "dynamodb_local_latest" ]
then
    mkdir dynamodb_local_latest
fi

# extract the file
tar -zxvf dynamodb_local_latest.tar.gz --directory dynamodb_local_latest
