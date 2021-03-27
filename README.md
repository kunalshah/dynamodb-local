# README

Container image of  `DynamoDb Local` which persists data to disk.

If this image is useful to you, please consider giving it a `Star` on [GitHub](https://github.com/kunalshah/dynamodb-local) and/or [DockerHub](https://hub.docker.com/r/kunalshah/dynamodb-local)

---

## Why use this image

- This image persists to disk. Data can be read again after container restart or removal, whereas [Amazon provided container image of DynamoDb Local](https://hub.docker.com/r/amazon/dynamodb-local) is in-memory and currently there is no option to persist data.
- Continuously updated (everyday or few times a week) so that you always get latest version of DynamoDb Local
- About 80 MB smaller than [Amazon provided container image of DynamoDb Local](https://hub.docker.com/r/amazon/dynamodb-local)
- [Source code](https://www.github.com/kunalshah/dynamodb-local) of this Docker image is available. See [Dockerfile](https://github.com/kunalshah/dynamodb-local/blob/main/Dockerfile).

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
```

Container will be removed when it exits due to `--rm`

However, data will persist in `$PWD/shared-local-instance.db`

---

## Other Information

1. Why is this image based on [bitnami/java](https://github.com/kunalshah/dynamodb-local/blob/main/Dockerfile#L6)

    `bitnami/java` is well maintained, uses CI/CD and it is continuously updated.
    
    When `bitnami/java` publishes new image (almost every day or week), new build of `kunalshah/dynamodb-local` triggers on DockerHub automatically.

    So you get latest version of `DynamoDb Local` when you download this image.

2. How to build and run this image yourself

    In this git repository:
    1. See [docker/build.sh](https://github.com/kunalshah/dynamodb-local/blob/main/docker/build.sh) to build the local image
    2. See [docker/run.sh](https://github.com/kunalshah/dynamodb-local/blob/main/docker/run.sh) to run the locally built image

3. How to run DynamoDb Local without Docker

    In this git repository:

    - See [local/download.sh](https://github.com/kunalshah/dynamodb-local/blob/main/local/download.sh) to download the latest version of DynamoDb Local
    - See [local/run.sh](https://github.com/kunalshah/dynamodb-local/blob/main/local/run.sh) to run the run the downloaded DynamoDb Local
