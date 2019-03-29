#!/usr/bin/env bash

# Original source - https://www.linuxjournal.com/content/downloading-entire-web-site-wget

# Check if website and domain is not specified
if [[ -z $@ ]]; then
    echo "You should specified website and domain";
    exit;
fi

# Get website and domain
WEBSITE=$1;
DOMAIN=$2;

# Download entire website on current directory
wget --recursive --no-clobber --page-requisites --html-extension --convert-links --restrict-file-names=windows --domains=$DOMAIN --no-parent $WEBSITE;

# Check if there're no errors
if [[ $? -eq 0 ]]; then
    echo "Website downloaded successfully";
fi
