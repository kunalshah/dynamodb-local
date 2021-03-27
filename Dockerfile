# Base Image is bitnami/java because:
# - It is well maintained
# - It uses CI/CD. New image is published almost every day or week
# - https://hub.docker.com/r/kunalshah/dynamodb-local is setup such that new build of this image will trigger when new image of bitnami/java is published

FROM bitnami/java

# Update packages and install curl
RUN apt-get update && apt-get install -y curl

# Set /app as working directory. dynamodb local will be installed to this directory.
WORKDIR /app

# Download latest version of dynamodb-local from AWS
# See https://docs.amazonaws.cn/en_us/amazondynamodb/latest/developerguide/DynamoDBLocal.DownloadingAndRunning.html
RUN curl -O https://s3.us-west-2.amazonaws.com/dynamodb-local/dynamodb_local_latest.tar.gz

# Extract the dynamodb-local package
RUN tar zxvf dynamodb_local_latest.tar.gz

# See https://docs.amazonaws.cn/en_us/amazondynamodb/latest/developerguide/DynamoDBLocal.UsageNotes.html

# Use port 8000 so that NoSQL Workenech can continue to work
# Default port is 8000 but pass explicitly so that port can be modified in the future if needed

# Use -sharedDb to use single file for data read/write
# NoSQL Workbench uses localhost region which makes it difficult to share the data with other apps
# -sharedDb will allow sharing between NoSQL Workbench, AWS CLI and other applications

# Pass the /data folder as a volume while running this container which allows storing the data outside the container
# See docker/run.sh for example

EXPOSE 8000

CMD [ "java", "-jar", "DynamoDBLocal.jar", "-cors", "*", "-port", "8000", "-dbPath", "/data", "-sharedDb", "-optimizeDbBeforeStartup"]
