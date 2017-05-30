#!/bin/sh

# Filename
NOW=$(date +"%F-%T");
FILE="flynn-$NOW.backup";

# Perform the backup.
flynn cluster backup --file=$FILE;

# Upload the backup to S3.
aws s3 cp $FILE s3://$AWS_BUCKET/;

# Message.
echo "-";
echo "-";
echo "DONE WITH BACKUP $FILE.";
echo "-";
echo "-";