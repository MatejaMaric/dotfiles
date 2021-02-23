#!/usr/bin/env bash
pass -c $(find $HOME/.password-store -type f -iname *gpg | sed 's/.*password-store\/\(.*\).gpg/\1/' | sort | rofi -dmenu)
