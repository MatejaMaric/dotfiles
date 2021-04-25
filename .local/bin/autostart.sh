#!/usr/bin/env bash
xset -b

#setxkbmap -option caps:swapescape
#setxkbmap -layout us,rs,rs -variant ,alternatequotes,latin -option grp:alt_shift_toggle,caps:swapescape
setxkbmap -layout us,rs,rs -variant ,alternatequotes,latin -option caps:swapescape

numlockx &
dunst &
udiskie &

#picom &
compton --backend glx -b &

feh --bg-fill ~/stuff/pictures/nantes.jpg

#mpd &
