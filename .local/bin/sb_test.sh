#!/bin/sh

case $BUTTON in
	# Left mouse click
	1) notify-send "$BUTTON" ;;

	# Middle mouse click
	2) notify-send "$BUTTON" ;;

	# Right mouse click
	3) notify-send "$BUTTON" ;;

	# Mouse wheel up
	4) notify-send "$BUTTON" ;;

	# Mouse wheel down
	5) notify-send "$BUTTON" ;;
esac

printf "Test"
