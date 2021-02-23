#!/usr/bin/env bash

shopt -s expand_aliases
# alias list_passwords='dmenu'
alias list_passwords='rofi -dmenu'

pass -c $(find $HOME/.password-store -type f -iname *gpg | sed 's/.*password-store\/\(.*\).gpg/\1/' | sort | list_passwords)
