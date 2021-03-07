# Assuming that your current folder is already shared with docker desktop. 
# If not, you can share it through Docker Desktop -> Preferences -> Resource -> File Sharing

# Note that we use --rm here so the container will be removed when it exits. However, data will persist as shared-instance.db
# So you will be able to read the tables and data when you run the container again

# Run image built with docker/build.sh

docker run \
--rm \
-d \
-v $PWD:/data \
-p 8000:8000 \
--name dynamodb-local \
dynamodb-local:latest
