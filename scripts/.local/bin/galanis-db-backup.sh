#!/bin/bash

# Check if the project name is provided
if [ -z "$1" ]; then
  echo "Usage: $0 <project_name>"
  exit 1
fi

project_name=$1
echo "project_name: $project_name"

# Variables for remote server and files
today=$(date +"%d%m%y")
local_dir="$(cd "~/Desktop" && pwd)"
user="gsport"
ip_addr="168.119.175.108"
backup_dir="$local_dir/backups-$today"

# Check if the directory exists before creating it
if [ ! -d "$backup_dir" ]; then
  mkdir "$backup_dir"
fi

remote_server="$user@$ip_addr"
remote_file1="/home/$project_name/docker-volumes/$project_name-postgresql-$today.zip"
remote_file2="/home/$project_name/docker-volumes/$project_name-couchdb-$today.zip"
download_dir="$backup_dir"

# # Upload and download the files via SFTP
sftp -P 5522 $remote_server <<EOF
get $remote_file1 $download_dir
get $remote_file2 $download_dir
bye
EOF

# Check if files are downloaded
if [[ -f "$download_dir/$(basename $remote_file1)" && -f "$download_dir/$(basename $remote_file2)" ]]; then
    echo "Files downloaded successfully!"
else
    echo "Failed to download files."
    exit 1
fi
#Extracting the files
cd $download_dir
7z x "$project_name-couchdb-$today.zip"
7z x "$project_name-postgresql-$today.zip"

mv "$project_name-postgresql" "$project_name-postgresql-flask"

rm -f  "$project_name-couchdb-$today.zip"
rm -f  "$project_name-postgresql-$today.zip"
echo "Done!"
