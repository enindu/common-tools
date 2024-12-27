#!/bin/bash

# Source: https://www.linuxjournal.com/content/downloading-entire-web-site-wget
# Dependencies: wget

if [[ -z $1 ]] || [[ -z $2 ]]
then
    echo "Usage:   sh download-website.sh <url> <domain>"
    echo "Example: sh download-website.sh https://enindu.com enindu.com"
    exit
fi

wget \
    --recursive \
    --page-requisites \
    --html-extension \
    --convert-links \
    --no-parent \
    --restrict-file-names="windows" \
    --execute="robots=off" \
    --domains="$2" \
    $1

if [[ $? -ne 0 ]]
then
    echo "Error: Something went wrong"
    exit
fi

echo "Success: Website downloaded successfully"
