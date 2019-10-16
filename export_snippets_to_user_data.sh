#!/bin/bash
## Copying snippets in the UserData directory
## 
## Usage:
## 	sh export_snippets_to_user_data.sh
##
## Copyright © 2016 Oleksii Naboichenko. All rights reserved.

# Variables
snippets_directory_name="CodeSnippets"
source=$(pwd)/${snippets_directory_name}
destination=$"$HOME/Library/Developer/Xcode/UserData"

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
sh ./copy_directory.sh --source=${source} --destination=${destination}

# Relaunch Xcode
sh ./restart_application.sh --bundle="Xcode"

exit 0
