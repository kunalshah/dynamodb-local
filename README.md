# README

## Why use this container
- Amazon provides [local dynamodb](https://hub.docker.com/r/amazon/dynamodb-local) but it it in-memory so data doesn't persist after restart of the container.
- This docker image is ~200MB smaller than [Amazon's local dynamodb](https://hub.docker.com/r/amazon/dynamodb-local)
- Source code is available of this Docker image. See [Dockerfile](https://github.com/kunalshah/dynamodb-local/Dockerfile)

## About this image
This dynamodb-local container image 
- allow you to persist the data between container restarts and removal
- uses Dynamodb's default port 8000

If you want Dynamodb Local to listen on some other port, 
then you can clone the repo, change the port in Dockerfile and rebuild the image.

## How to run this image

```bash
# Assuming that your current folder is already shared with docker desktop. 
# If not, you can share it through Docker Desktop -> Preferences -> Resource -> File Sharing

# Note that we use --rm here so the container will be removed when it exits. However, data will persist as shared-instance.db
# So you will be able to read the tables and data when you run the container again

docker run \
--rm \
-d \
--name dynamodb-local \
-v $PWD:/data \
-p 8000:8000 \
dynamodb-local:latest
```

## How to build and run this image yourself
In this git repository, see docker/build.sh and docker/run.sh

## How to run dynamodb local without docker container
In this git repository, see local/download.sh and local/run.sh
