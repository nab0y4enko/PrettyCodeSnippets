#!/bin/bash
## Importing code snippets in the current directory
## 
## Usage:
## 	sh import-snippets-from-user-data.sh
##
## Copyright © 2016 Oleksii Naboichenko. All rights reserved.

# Variables
snippets_directory_name="CodeSnippets"
source=$"$HOME/Library/Developer/Xcode/UserData"/${snippets_directory_name}
destination=$(pwd)

# Check source directory
if ! [ -d ${source} ]; then
    echo "${source} not found"
    exit 1
fi

# Check destination directory
if ! [ -d ${destination} ]; then
    echo "${destination} not found"
    exit 1
fi

# Copy files
sh ./copy-directory.sh --source=${source} --destination=${destination}

exit 0
