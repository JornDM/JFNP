#!/bin/bash 

# This script will install an Apache Exporter

# VARS
user=$(whoami)
stepcount=1

# FUNCTIONS
function printStep() {    
    echo "---------------------STEP $stepcount-------------------------"
     stepcount=$((stepcount + 1))
}

function printOverview() {
    echo '============ OVERVIEW ======================================='
    echo "Downloaded repo from github:                  $(if [ $downloadFlag -eq 1 ]; then echo "Yes"; else echo "Already OK"; fi)"
    echo "Extracted files:                              $(if [ $extractFlag -eq 1 ]; then echo "Yes"; else echo "Already OK"; fi)"
    echo "Moved extracted dir to /usr/local/bin:        $(if [ $copyFlag -eq 1 ]; then echo "Yes"; else echo "Already OK"; fi)"      
    echo "Changed file permissions                      $(if [ $permissionFlag -eq 1 ]; then echo "Yes"; else echo "Already OK"; fi)"
    echo "Created Prometheus Group                      $(if [ $groupFlag -eq 1 ]; then echo "Yes"; else echo "Already OK"; fi)"
    echo "Created Prometheus User                       $(if [ $user_created_flag -eq 1 ]; then echo "Yes"; else echo "Already OK"; fi)"
    echo "============================================================="

}
# 1. Clone files of apache exporter
printStep 
echo 'Checking wether the repository is already available on the system'
if [ -e "/home/$user/apache_exporter-0.11.0.linux-amd64.tar.gz" ]; then 
    echo 'The directory already exists on this system, moving on...'
    downloadFlag=0
else
    echo 'The directory is not yet on the system. Cloning is right now...'
    curl -s https://api.github.com/repos/Lusitaniae/apache_exporter/releases/latest| grep browser_download_url| grep linux-amd64|cut -d '"' -f 4|wget -qi - -P /home/root/
    downloadFlag=1
fi 

# 2. Extract the files 
printStep 
if [ -e "/home/$user/apache_exporter-0.11.0.linux-amd64/" ]; then 
    echo "The directory has already been extracted, moving on..."
    extractFlag=0

else 
    echo 'The directory has not yet been extracted. Doing it right now...'
    tar xvf "/home/$user/apache_exporter-0.11.0.linux-amd64.tar.gz"
    extractFlag=1
fi 

# 3. Copy files to /usr/local/bin 
printStep 
if [ -e "/usr/local/bin/apache_exporter-0.11.0.linux-amd64/" ]; then 
    echo "The exporter has already been copied to /usr/local/bin/"
    copyFlag=0 
else 
    echo 'The exporter has not yet been copied to /usr/local/bin. Doing it right now...'
    cp -r /home/$user/apache_exporter-0.11.0.linux-amd64/ /usr/local/bin/ 
    copyFlag=1 
fi 

# 4. Change file permissions of the script 
printStep
permissions_apache_exporter=$(ls -l "/usr/local/bin/apache_exporter-0.11.0.linux-amd64/" | grep 'apache_exporter' | awk '{print $1}')

if [ $permissions_apache_exporter != '-rwxr-xr-x.' ]; then 
    echo 'File permissions are not correct for the script. Changing them right now...'
    chmod 755 /usr/local/bin/apache_exporter-0.11.0.linux-amd64/apache_exporter
    permissionFlag=1
else 
    echo 'File permissions are correct, moving on...'
    permissionFlag=0
fi 

# 5. Adding group 'Prometheus'
printStep
group_created=$(cat /etc/group | grep 'prometheus')

if [ -z "$group_created" ]; then 
    echo 'The group has not been created yet. Creating it right now...'
    sudo groupadd --system prometheus
    groupFlag=1 

else 
    echo 'The group has already been created. Doing nothing...'
    groupFlag=0
fi 

# 6. Adding user 'Prometheus'
printStep 
user_created=$(cat /etc/passwd | grep 'prometheus')

if [ -z "$user_created" ]; then 
    echo "User 'prometheus' has not been created yet. Creating him right now..."
    sudo useradd -s /sbin/nologin --system -g prometheus prometheus
    user_created_flag=1
else 
    echo "User 'prometheus' has already been created. Moving on..."
    user_created_flag=0
fi 

# Copying script to correct dir 
cp "/usr/local/bin/apache_exporter-0.11.0.linux-amd64/apache_exporter" "/usr/local/bin"

# 7. Restarting everything 
sudo systemctl daemon-reload
sudo systemctl start apache_exporter.service
sudo systemctl enable apache_exporter.service

# 8. Print overview
printOverview