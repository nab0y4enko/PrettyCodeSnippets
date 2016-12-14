#!/bin/bash
## Script to copy directories
## 
## Usage:
## 	sh copy-directory [option1] ARG1 [option1] ARG2
## 
## Options:
## 	-s, --source		Source directory
## 	-d, --destination	Destination directory
##
## Copyright © 2016 Oleksii Naboichenko. All rights reserved.

# Check parameters
if [ $# -le 0 ]; then
	echo "Parameters are missing"
	exit 1
fi

# Variables
source=""
destination=""

# Get parameters
while [ "$#" -gt 0 ]; do
	case "$1" in
		-s) source="$2"; shift 2;;
		--source=*) source="${1#*=}"; shift 1;;

		-d) destination="$2"; shift 2;;
		--destination=*) destination="${1#*=}"; shift 1;;

		-*) echo "Unknown option: $1" >&2; exit 1;;
	esac
done

# Check parameters
if [ -z ${source} ]; then
    echo "Source directory is not specified."
    exit 1
fi

if [ -z ${destination} ]; then
    echo "Destination directory is not specified."
    exit 1
fi

# Copy directory
if [ -d ${source} ]; then

    cp -r ${source} ${destination}
    if [ $? -ne 0 ]; then
    	echo "Copy failed."
  		exit 1
    else
    	echo "Copy successful."
	fi
else
    echo "${source} not found."
fi
