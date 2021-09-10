# README

Container image of  `DynamoDb Local` which persists data to disk.

If this image is useful to you, please consider giving it a `Star` on [GitHub](https://github.com/kunalshah/dynamodb-local) and/or [DockerHub](https://hub.docker.com/r/kunalshah/dynamodb-local)

---

## Why use this image

- This image persists to disk by default, whereas [Amazon's container image of DynamoDb Local](https://hub.docker.com/r/amazon/dynamodb-local) is in-memory and currently there is no option to configure it
- Continuously updated (everyday or few times a week) so that you always get latest version of DynamoDb Local
- About 80 MB smaller than Amazon's container image of DynamoDb Local
- Source code is available on GitHub. See [Dockerfile](https://github.com/kunalshah/dynamodb-local/blob/main/Dockerfile).

---

## About this image

- Persists data to `shared-local-instance.db`. Data can be read/written again after container restarts and removal.
- Uses sharedDb so that applications can access the data regardless of the region
- Listens on DynamoDb's default port 8000

---

## How to run this image

```bash
# Assuming that your current folder ($PWD) is already shared with Docker Desktop
# If not, you can share it through Docker Desktop -> Preferences -> Resource -> File Sharing

docker pull kunalshah/dynamodb-local

docker run \
--rm \
-d \
-v $PWD:/data \
-p 8000:8000 \
--name dynamodb-local \
kunalshah/dynamodb-local

# Due to usage of --rm, container will be removed when it exits
# However, data will persist in $PWD/shared-local-instance.db
```

#### Connecting to DynamoDb Container through AWS CLI

```bash
#profile name from ~/.aws/credentials
export AWS_PROFILE=MyAWSProfile

aws dynamodb list-tables --endpoint-url http://localhost:8000

or

aws dynamodb list-tables --endpoint-url http://localhost:8000 --profile MyAWSProfile
```

## Other Information

1. How to build and run this image locally

    1. See [docker/build.sh](https://github.com/kunalshah/dynamodb-local/blob/main/docker/build.sh) to build the image
    2. See [docker/run.sh](https://github.com/kunalshah/dynamodb-local/blob/main/docker/run.sh) to run the locally built image

2. How to run DynamoDb Local without Docker

    - See [local/download.sh](https://github.com/kunalshah/dynamodb-local/blob/main/local/download.sh) to download DynamoDb Local
    - See [local/run.sh](https://github.com/kunalshah/dynamodb-local/blob/main/local/run.sh) to run DynamoDb Local

3. Why this image is based on [bitnami/java](https://github.com/kunalshah/dynamodb-local/blob/main/Dockerfile#L6)

    `bitnami/java` is well maintained, uses CI/CD and it is continuously updated.
    
    When `bitnami/java` publishes new image (almost every day or week), new build of `kunalshah/dynamodb-local` triggers on DockerHub automatically.

    So you get latest version of `DynamoDb Local` when you download this image.

