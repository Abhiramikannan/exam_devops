#!/bin/bash
# File Organizer Script
# author: Akash chandran
# the way to run is ./file_organizer.sh <path>
# This script organizes files in a specified directory by moving them into subdirectories based on their file extensions.


if [ "-z" "$1" ]; then
    echo "dir not provided"
    exit 1
fi

DIR_PATH=$1

read -p "Do you want to organize files in $DIR_PATH? (y/n): " answer
if [[ $answer != "y" ]]; then
    echo "Exiting..."
    exit 0
fi
read -p "Enter the file extension to organize: " extension
mkdir -p "$DIR_PATH/oraganized/$extension"

count=0
for File in "$DIR_PATH"/*."$extension"; do
    if [ -f "$File" ]; then
        mv "$File" "$DIR_PATH/oraganized/$extension"
        echo "Moved $File to $DIR_PATH/oraganized/$extension"
        ((count++))
    fi
done
echo "Total files moved: $count"