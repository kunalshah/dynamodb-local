FROM openjdk:17-slim-buster

# update packages and install curl
RUN apt-get update && apt-get install -y curl

# dynamodb local will be installed to /app directory 
WORKDIR /app

# See https://docs.amazonaws.cn/en_us/amazondynamodb/latest/developerguide/DynamoDBLocal.DownloadingAndRunning.html

# download latest version of dynamodb-local
RUN curl -O https://s3.us-west-2.amazonaws.com/dynamodb-local/dynamodb_local_latest.tar.gz

# extract the file
RUN tar zxvf dynamodb_local_latest.tar.gz

# See https://docs.amazonaws.cn/en_us/amazondynamodb/latest/developerguide/DynamoDBLocal.UsageNotes.html

# Use port 8000 so that NoSQL Workenech can continue to work
# Default port is 8000 but pass explicitly so that port can be modified in the future if needed

# Use -sharedDb so that data is written to single file
# NoSQL Workbench uses localhost region which makes it difficult to share the data with other apps
# -sharedDb will allow sharing between NoSQL Workbench, AWS CLI and other applications

# Pass the /data folder as a volume while running this container which allows storing the data outside the container
# See run.sh for example

EXPOSE 8000

CMD [ "java", "-jar", "DynamoDBLocal.jar", "-cors", "*", "-port", "8000", "-dbPath", "/data", "-sharedDb", "-optimizeDbBeforeStartup"]