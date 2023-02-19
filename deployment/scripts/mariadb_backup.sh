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
up_flag=$(ping -w 4 192.168.10.3 | grep '4 packets transmitted, 4 received, 0% packet loss')
latest_backup=$(ls /home/vagrant/db_backups | tail -1)


# Functions
function create-backup {
    # Start creating backup...
    echo 'Everything ok, creating backup...'
    mysqldump -ujeff -ptest123 $db_name > "$full_path"
    gzip "$full_path"

    echo "Done! Your backup has been created at $backupdir_path" 
}

# This function will send the backup to another server (probably 192.168.10.3) 
function forward-backup {
    if [ -z "$up_flag" ];
    then 
        echo 'There is something not right with the router VM. Ping was not 100% successful so there was no backup transfered...'
    else 
        echo 'The ping test was successful! It is possible to forward the backup to the router.'
        echo "Currently, the latest backup is ${latest_backup}. This backup will be forwarded!"
        echo 'Forwarding it right now...'
        sshpass -p vagrant scp -o StrictHostKeyChecking=no "/home/vagrant/db_backups/$latest_backup" vagrant@192.168.10.3:/home/vagrant 
    fi
}

# Check if the backup directory exists
if [ ! -d "$backupdir_path" ]; then 
    echo 'The location you provided to store the backup could not be found...'
else 
    # Check if the backup already exists
    if [ -d "$backupdir_path/$db_name" ]; then 
        echo "This backup already exists in $backupdir_path"
    else 
        # Call the create-backup function
        create-backup

        # Call the forward-backup function
        forward-backup
    fi 
fi 
