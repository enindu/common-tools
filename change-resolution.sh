#!/usr/bin/env bash

# Original source - https://gist.github.com/chirag64/7853413

# Check if resolution is not specified
if [[ -z $@ ]]; then
    echo "You should specified resolution";
    exit;
fi

# Get resolution
RESOLUTION=$@;

# Check if resolution is not valid
if [[ $(($(echo $RESOLUTION | grep -o "\s" | wc --chars) / 2 )) -ne 2 ]]; then
    echo "Invalid resolution";

    exit;
fi

# Get mod name and display name
MOD_NAME=$(echo $RESOLUTION | sed 's/\s/_/g');
DISPLAY_NAME=$(xrandr | grep -Po '.+(?=\sconnected)');

# If mod not available add new mod
if [[ $(xrandr|grep $MOD_NAME) = "" ]]; then
    xrandr --newmode $MOD_NAME $(gtf $(echo $RESOLUTION) | grep -oP '(?<="\s\s).+') && xrandr --addmode $DISPLAY_NAME $MOD_NAME;
fi

# Change resolution
xrandr --output $DISPLAY_NAME --mode $MOD_NAME;

# Check if there're no errors
if [[ $? -eq 0 ]]; then
    echo "Resolution changed successfully";
fi