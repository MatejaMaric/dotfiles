#!/bin/sh

case $1 in
	-i)
		amixer -q sset Master 5%+
		pkill -SIGRTMIN+11 dwmblocks
	;;

	-d)
		amixer -q sset Master 5%-
		pkill -SIGRTMIN+11 dwmblocks
	;;

	-t)
		amixer -q sset Master toggle
		pkill -SIGRTMIN+11 dwmblocks
	;;

	-n)
		xkb-switch -n
		pkill -SIGRTMIN+10 dwmblocks
	;;
esac
