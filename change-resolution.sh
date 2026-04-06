#!/bin/bash

# Source: https://gist.github.com/chirag64/7853413
# Dependencies: grep
#               sed
#               xorg-server
#               xorg-xrandr

if [[ -z $@ ]]; then
	echo "Usage: sh change-resolution.sh [width] [height] [refresh rate]"
	exit
fi

mod=$(echo $@ | sed "s/\s/_/g")
screen=$(xrandr | grep -Po ".+(?=\sconnected)")

if [[ $(xrandr | grep $mod) = "" ]]; then
	xrandr --newmode $mod $(gtf $@ | grep -Po "(?<=\"\s\s).+")
	xrandr --addmode $screen $mod
fi

xrandr \
	--output $screen \
	--mode $mod

if [[ $? -ne 0 ]]; then
	echo "Something went wrong."
	exit
fi

echo "Resolution is changed."
