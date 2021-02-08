alias ls='ls --color=auto'
alias ll='ls --color=auto -lAh'
#alias l='ls -CF'

alias dir='dir --color=auto'
alias vdir='vdir --color=auto'

alias grep='grep --color=auto'
alias fgrep='fgrep --color=auto'
alias egrep='egrep --color=auto'


alias yts="mpv --ytdl-format='bestvideo[height<=360]+bestaudio'"
alias ytd='youtube-dl -o "%(playlist_index)d-%(title)s.%(ext)s"'
alias ytv3="youtube-dl --write-auto-sub -f 'bestvideo[height<=360]+bestaudio/best[height<=360]' -o '%(playlist_index)d-%(title)s.%(ext)s'"
alias ytv4="youtube-dl --write-auto-sub -f 'bestvideo[height<=480]+bestaudio/best[height<=480]' -o '%(playlist_index)d-%(title)s.%(ext)s'"
alias ytv7="youtube-dl --write-auto-sub -f 'bestvideo[height<=720]+bestaudio/best[height<=720]' -o '%(playlist_index)d-%(title)s.%(ext)s'"
alias ytv10="youtube-dl --write-auto-sub -f 'bestvideo[height<=1080]+bestaudio/best[height<=1080]' -o '%(playlist_index)d-%(title)s.%(ext)s'"
alias yta='youtube-dl --extract-audio -o "%(playlist_index)d-%(title)s.%(ext)s"'
