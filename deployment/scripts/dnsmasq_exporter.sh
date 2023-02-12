#!/bin/bash 

# This script will install the dnsmasq exporter and run it inside a docker container.

# VARS
user=$(whoami)
stepcount=1

# FUNCTIONS
function printStep() {    
    echo "---------------------STEP $stepcount-------------------------"
     stepcount=$((stepcount + 1))
}

function printOverview() {
    echo '============ OVERVIEW ========================================================'
    echo "Downloaded repo from github:                  $(if [ $cloneFlag -eq 1 ]; then echo "Yes"; else echo "No"; fi)"
    echo "Change localhost to IP router:                This step is always executed"
    echo "Change entry in Dockerfile:                   This step is always executed"
    echo "Created the docker image                      $(if [ $imgCreated -eq 1 ]; then echo "Yes"; else echo "No"; fi)"      
    echo "Started the container                         $(if [ $containerRun -eq 1 ]; then echo "Yes"; else echo "Already running"; fi)"
}

# 1. Clone the repo from github
printStep 
if [ -e "/home/$user/dnsmasq_exporter" ]; then 
    echo 'The directory already exists on this system, moving on...'
    cloneFlag=0
else 
    echo 'The directory is not yet on this system, cloning it right now...'
    cd "/home/$user" ; git clone https://github.com/google/dnsmasq_exporter.git 
    cloneFlag=1 
fi 

# 2. Changing the file dnsmasq.go 
printStep 
echo "Changing the first entry of 'localhost' to '192.168.10.3' in file dnsmasq.go..." 
sed -i 's/localhost/192.168.10.3/' "/home/$user/dnsmasq_exporter/dnsmasq.go"

# 3. Change the docker file to use other module
printStep 
echo "Change the entry golang:1.17.2-stretch to docker.io/library/golang:1.17.2-stretch in Dockerfile"
sed -i 's/FROM golang:1.17.2-stretch AS build-env/FROM docker.io\/library\/golang:1.17.2-stretch AS build-env/g' "/home/$user/dnsmasq_exporter/Dockerfile"


# 4. Create docker image if it hasn't been created yet  
printStep 
image_created_flag=$(docker images | grep 'localhost/dnsmasq_exporter')

if [ -z "$image_created_flag" ]; then 
    echo 'The docker image has not been created yet. Creating it right now...'
    docker build -t dnsmasq_exporter "/home/$user/dnsmasq_exporter"
    imgCreated=1
else    
    echo 'The docker image has already been created. Moving on...'
    imgCreated=0 
fi 

# 5. Run docker container if it is not already running 
printStep 
container_run_flag=$(docker ps | grep 'dnsmasq_exporter')

if [ -z "$container_run_flag" ]; then 
    echo 'The container is not yet running. Starting it up right now!'
    docker run -d --restart=unless-stopped --net=host dnsmasq_exporter
    containerRun=1
else 
    echo 'The container is already running. Doing nothing...'
    containerRun=0 
fi 

# Prints summary of the script
printOverview