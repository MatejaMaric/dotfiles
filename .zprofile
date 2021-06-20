[[ -f ~/.config/zsh/zshrc ]] && . ~/.config/zsh/zshrc

if [[ ! $DISPLAY && $XDG_VTNR -eq 1 ]]; then
	  startx
fi
