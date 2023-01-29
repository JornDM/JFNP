#!/bin/bash 

# Author    = Jorn De Meyer
# Date      = 29/01/2023

# This script will create a backup from the mariadb database 'Plants' and store it locally. It will also forward the backup to another server!

# Variables
currentDate=$(date | tr ' ' '_')
backupdir_path=/home/vagrant/db_backups
db_name='Plants'
backup_name="$db_name-$currentDate"
full_path=$backupdir_path/"$backup_name"

# Functions
function create-backup {
    # Start creating backup...
    echo 'Everything ok, creating backup...'
    mysqldump -ujeff -ptest123 $db_name > "$full_path"
    gzip "$full_path"

    echo "Done! Your backup has been created at $backupdir_path" 
    exit 0
}

function forward-backup {
    # This function will send the backup to another server (probably 192.168.10.3)
    pass 
}

# Start Script
if [ ! -d "$backupdir_path" ]; then 
    echo 'The location you provided to store the backup could not be found...'
    exit 1
else 

if [ -d "$backupdir_path/$db_name" ]; then 
    echo "This backup already exists in $backupdir_path"
    exit 1 
else 
    # Calling function that will create the backup
    create-backup
fi 
fi 

# End Script
