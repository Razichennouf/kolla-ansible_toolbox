#!/bin/bash

#Function to check if there are containers running
function check_containers() {
    if [ "$(docker ps -q)" ]; then
        return 0  # Containers found
    else
        return 1  # No containers found
    fi
}
#Function to check if there are images available
function check_images() {
    if [ "$(docker images -q)" ]; then
        return 0  # Images found
    else
        return 1  # No images found
    fi
}
#Function to check if there are volumes
function check_volumes() {
    if [ "$(docker volume ls -q)" ]; then
        return 0  # Volumes found
    else
        return 1  # No volumes found
    fi
}
# Stopping and removing containers
if check_containers; then
    echo "Stopping and removing containers..."
    docker stop $(docker ps -qa)
    docker rm $(docker ps -qa)
else
    echo "No containers to remove."
fi
echo "*************************************************"
#Removing images
if check_images; then
    echo "Removing images..."
    docker rmi $(docker images -qa)
else
    echo "No images to remove."
fi
echo "*************************************************"
#Removing volumes
if check_volumes; then
    echo "Removing volumes..."
    docker volume rm $(docker volume ls -q)
else
    echo "No volumes to remove."
fi
echo "*************************************************"
docker_dir="/var/lib/docker"
if ls "$docker_dir"/*/ > /dev/null 2>&1; then
    echo "Removing contents of directories under $docker_dir"
    for dir in "$docker_dir"/*/; do
        # Skip if the entry is not a directory
        if [[ ! -d "$dir" ]]; then
            continue
        fi
        echo "Removing contents of $dir"
        rm -rf "$dir"*
    done
else
    echo "No directories to remove contents from."
fi
echo "*************************************************"
#Remove temporary files
rm -rf /tmp/*
echo "Removed temporary files"
