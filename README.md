# README

## Why use this image

- [Amazon provided DynamoDb Local container image](https://hub.docker.com/r/amazon/dynamodb-local) is in-memory so data doesn't persist. This image allows data persistence between container restart and/or container removal.
- This docker image is ~200MB smaller than [Amazon provided DynamoDb Local container image](https://hub.docker.com/r/amazon/dynamodb-local)
- Source code of this Docker image is available. See [Dockerfile](https://github.com/kunalshah/dynamodb-local/blob/main/Dockerfile). You can change parameters in [Dockerfile](https://github.com/kunalshah/dynamodb-local/blob/main/Dockerfile) and re-build the image if you need to. Instructions are provided below.

---

## About this image

This dynamodb-local container image:

- Allow data persistence between container restarts and removal
- Uses DynamoDb's default port 8000
- Uses sharedDb so that applications can access the data regardless of the region

If you want DynamoDb Local to listen to other port, or you don't want sharedDB,
then you can clone the repo, change appropriately in [Dockerfile](https://github.com/kunalshah/dynamodb-local/blob/main/Dockerfile) and re-build the image.

---

## How to run this image

```bash
# Assuming that your current folder is already shared with docker desktop. 
# If not, you can share it through Docker Desktop -> Preferences -> Resource -> File Sharing

# Note that we use --rm here so the container will be removed when it exits. However, data will persist as shared-instance.db
# So you will be able to read the tables and data when you run the container again

docker run \
--rm \
-d \
-v $PWD:/data \
-p 8000:8000 \
--name dynamodb-local \
kunalshah/dynamodb-local:latest
```

### Data will be stored in `$PWD/shared-local-instance.db`

---

## How to build and run this image yourself

In this git repository:
- See [docker/build.sh](https://github.com/kunalshah/dynamodb-local/blob/main/docker/build.sh) to build the local image
- See [docker/run.sh](https://github.com/kunalshah/dynamodb-local/blob/main/docker/run.sh) to run the locally built image

---

## How to run DynamoDb Local without Docker

In this git repository:

- See [local/download.sh](https://github.com/kunalshah/dynamodb-local/blob/main/local/download.sh) to download the latest version of DynamoDb Local
- See [local/run.sh](https://github.com/kunalshah/dynamodb-local/blob/main/local/run.sh) to run the run the downloaded DynamoDb Local
