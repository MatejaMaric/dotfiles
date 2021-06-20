[[ -f ~/.bashrc ]] && . ~/.bashrc

eval $(keychain --eval --agents gpg,ssh --quiet)
export XDG_CONFIG_HOME=$HOME/.config
export XDG_CACHE_HOME=$HOME/.cache
export XDG_DATA_HOME=$HOME/.local/share
export ZDOTDIR=$HOME/.config/zsh

if [[ ! $DISPLAY && $XDG_VTNR -eq 1 ]]; then
	  startx
fi
