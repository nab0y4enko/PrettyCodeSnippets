#!/bin/bash
## Importing code snippets in the current directory
## 
## Usage:
## 	sh import_snippets_from_user_data.sh
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

# Clear destination directory
rm -r ${destination}/${snippets_directory_name}

# Copy files
sh ./copy_directory.sh --source=${source} --destination=${destination}

exit 0
