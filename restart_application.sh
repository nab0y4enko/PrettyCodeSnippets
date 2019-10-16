#!/bin/bash
## Script to restart application
## 
## Usage:
## 	sh restart-application.sh [option] ARG1
## 
## Options:
## 	-b, --bundle 	Application bundle name.
##
## Copyright © 2016 Oleksii Naboichenko. All rights reserved.

# Check parameters
if [ $# -le 0 ]; then
	echo "Parameters are missing"
	exit 1
fi

# Variables
app_bundle_name=""

# Get parameter
while [ "$#" -gt 0 ]; do
	case "$1" in
		-b) app_bundle_name="$2"; shift 2;;
		--bundle=*) app_bundle_name="${1#*=}"; shift 1;;

		-*) echo "Unknown option: $1" >&2; exit 1;;
	esac
done

# Close application
killall ${app_bundle_name} 2> /dev/null

sleep 1

# Launch application
open "/Applications/${app_bundle_name}.app"

echo "${app_bundle_name} is restarted..."

exit 0
