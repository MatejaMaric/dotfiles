#!/usr/bin/env bash

options=$(lsblk | grep /media/$USER | rev | cut -d ' ' -f 1 | rev)
[ -n "$options" ] && opt_num=$(echo "$options" | wc -l) || opt_num=0
if [ $opt_num == 0 ]; then
	notify-send "Nothing mounted!"
elif [ $opt_num == 1 ]; then
	udiskie-umount "$options"
else
	unmount_device=$(echo "$options" | dmenu -p "What device you want to unmount?")
	[[ ! -z "$unmount_device" ]] && udiskie-umount "$unmount_device"
fi
