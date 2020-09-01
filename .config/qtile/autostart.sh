#!/bin/sh
xset -b
setxkbmap -option caps:swapescape
#setxkbmap -layout us,rs -variant ,alternatequotes -option grp:alt_shift_toggle,caps:swapescape
dunst &
udiskie &
#picom &
feh --bg-fill ~/stuff/pictures/alps-house.jpg
