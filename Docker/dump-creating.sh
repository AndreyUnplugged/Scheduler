#!/bin/bash
set -x
HOST=localhost
echo Start making dump >> dump.log
PORT=27017
# DB name
DBNAME=test
# S3 bucket name
BUCKET=test-mongo-anastasiya
# Current time
TIME=`/bin/date +%d-%m-%Y-%T`

# Backup directory
DEST=/home/$USER/tmp

# Tar file of backup directory
TAR=$DEST/../$TIME.tar


# Create backup dir (-p to avoid warning if already exists)
/bin/mkdir -p $DEST
echo hello from dump script >> dump.log
# Log
echo "Backing up $HOST/$DBNAME to s3://$BUCKET/ on $TIME" >> dump.log
# Dump from mongodb host into backup directory
/usr/bin/mongodump  -h $HOST --port=$PORT -o $DEST --password=$MONGO_INITDB_ROOT_PASSWORD --username=$MONGO_INITDB_ROOT_USERNAME
echo Dump was built >> dump.log
# Create tar of backup directory
/bin/tar -cvf $TAR -C $DEST .

aws s3 mv $TAR s3://test-mongo-anastasiya