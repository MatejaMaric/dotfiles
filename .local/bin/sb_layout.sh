#!/bin/sh

case $BUTTON in
	# Left mouse click
	1) xkb-switch -n ;;
esac

printf $(xkb-switch -p | tr -d '\n')
