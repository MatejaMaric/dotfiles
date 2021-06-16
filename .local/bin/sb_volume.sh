#!/bin/sh

case $BUTTON in
	# Left mouse click
	1) amixer -q sset Master toggle ;;

	# Mouse wheel up
	4) amixer -q sset Master 1%+ ;;

	# Mouse wheel down
	5) amixer -q sset Master 1%- ;;
esac

amixer get Master | awk -F'[][]' 'END{ print toupper($(NF-1))": "$2 }'
