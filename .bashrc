#
# ~/.bashrc
#
PATH=$PATH:/home/$USER/programs/scripts

# If not running interactively, don't do anything
[[ $- != *i* ]] && return

#PS1='\T [\u@\h \W]\$ '
export PS1="\[$(tput bold)\]\[$(tput setaf 6)\]\T \[$(tput setaf 4)\][\[$(tput setaf 5)\]\u\[$(tput setaf 4)\]@\[$(tput setaf 5)\]\h \[$(tput setaf 2)\]\W\[$(tput setaf 4)\]]\\$ \[$(tput sgr0)\]"
test -r "~/.dir_colors" && eval $(dircolors ~/.dir_colors)
alias ls='ls --color=auto'

export EDITOR='nvim'
export VISUAL='nvim'

alias ytd='youtube-dl -o "%(playlist_index)d-%(title)s.%(ext)s"'
alias ytv10="youtube-dl --write-auto-sub -f 'bestvideo[height<=1080]+bestaudio/best[height<=1080]' -o '%(playlist_index)d-%(title)s.%(ext)s'"
alias ytv7="youtube-dl --write-auto-sub -f 'bestvideo[height<=720]+bestaudio/best[height<=720]' -o '%(playlist_index)d-%(title)s.%(ext)s'"
alias ytv4="youtube-dl --write-auto-sub -f 'bestvideo[height<=480]+bestaudio/best[height<=480]' -o '%(playlist_index)d-%(title)s.%(ext)s'"
alias ytv3="youtube-dl --write-auto-sub -f 'bestvideo[height<=360]+bestaudio/best[height<=360]' -o '%(playlist_index)d-%(title)s.%(ext)s'"
alias yts="mpv --ytdl-format='bestvideo[height<=360]+bestaudio'"
alias yta='youtube-dl --extract-audio -o "%(playlist_index)d-%(title)s.%(ext)s"'
