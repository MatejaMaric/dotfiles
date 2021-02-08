[[ -f ~/.bashrc ]] && . ~/.bashrc

eval $(keychain --clear --eval --agents gpg,ssh --quiet)

if [[ ! $DISPLAY && $XDG_VTNR -eq 1 ]]; then
	  startx
fi
