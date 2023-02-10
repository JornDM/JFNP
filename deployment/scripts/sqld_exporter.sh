#!/bin/bash 

# This script will install the sqld exporter 

# VARS
user=$(whoami)
stepcount=1

# FUNCTIONS
function printStep() {    
    echo "---------------------STEP $stepcount-------------------------"
     stepcount=$((stepcount + 1))
}

function printOverview() {
    echo '============ OVERVIEW ============'
    echo "Downloaded repo from github:                  $(if [ $downloadflag -eq 1 ]; then echo "Yes"; else echo "No"; fi)"
    echo "Extracted files:                              $(if [ $extractFlag -eq 1 ]; then echo "Yes"; else echo "No"; fi)"
    echo "Moved extracted dir to /usr/local/bin:        $(if [ $movedFlag -eq 1 ]; then echo "Yes"; else echo "No"; fi)"      
    echo "Changed file permissions                      $(if [ $permissionFlag -eq 1 ]; then echo "Yes"; else echo "No"; fi)"
    echo "Started the exporter                          $(if [ $runFlag -eq 1 ]; then echo "Yes"; else echo "No"; fi)"
}

# 1. Download exporter from GitHub
printStep
echo 'Checking wether the directory is already available on the system'
if [ -e "/home/$user/mysqld_exporter-0.14.0.linux-amd64.tar.gz" ]; then 
    echo "The file has already been downloaded on your system (in directory /home/$user/), moving on..."
    downloadflag=0
else
    echo "The file has not been found on your system in directory /home/$user/, it will be downloaded right now..." 
    curl -s https://api.github.com/repos/prometheus/mysqld_exporter/releases/latest   | grep browser_download_url   | grep linux-amd64 | cut -d '"' -f 4   | wget -qi - -P "/home/$user/"
    downloadflag=1
fi 

# 2. Extract the exporter from the zipped direcotry downloaded in the previous step 
printStep
echo 'Checking wether the directory has already been extracted'
if [ -e "/home/$user/mysqld_exporter-0.14.0.linux-amd64" ]; then 
    echo 'The file has already been extracted, moving on...'
    extractFlag=0
else
    echo 'The file has not yet been extracted, doing it right now...'
    tar xfs "/home/$user/mysqld_exporter-0.14.0.linux-amd64.tar.gz" -C "/home/$user/"
    extractFlag=1
fi

# 3. Move the extracted directory to /usr/local/bin
printStep
echo 'Checking wether the directory already exists in /usr/local/bin'
if [ -e "/usr/local/bin/mysqld_exporter-0.14.0.linux-amd64" ]; then 
    echo 'The file has already been moved to /usr/local/bin, moving on...'
    movedFlag=0
else 
    echo 'The file has not yet been moved to /usr/local/bin, doing it right now...'
    mv /home/$user/mysqld_exporter-0.14.0.linux-amd64/ /usr/local/bin 
    movedFlag=1
fi 

# 4. Change Permissions of the mysqld_exporter script
printStep
echo 'Checking file permissions of mysqld_exporter script'
permissions_mysqldexporter=$(ls -la /usr/local/bin/mysqld_exporter-0.14.0.linux-amd64 | grep 'mysqld_exporter' | awk '{print $1}')
if [ "$permissions_mysqldexporter" =  "-rwxr-xr-x" ]; then 
    echo 'File permissions are ok, moving on...'
    permissionFlag=0
else 
    echo 'File permissions are not ok, setting them now...'
    chmod 755 /usr/local/bin/mysqld_exporter-0.14.0.linux-amd64/mysqld_exporter
    echo 'File permissions have been changed.'
    permissionFlag=1
fi 

# 5. Start the exporter in the background 
printStep
echo 'Checking wether the exporter is already running'
exporter_run_flag=$(ps | grep 'mysqld_exporter')
if [ -z "$exporter_run_flag" ]; then 
    echo "The exporter is not runnning yet, starting it right now"
    /usr/local/bin/mysqld_exporter-0.14.0.linux-amd64/mysqld_exporter &
    runFlag=1
else
    echo 'The exporter is already running, doing nothing...'
    runFlag=0
fi 

printOverview 