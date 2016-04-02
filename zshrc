set -o vi

alias splatt="cd ~/dev/projects/splatt.net"
alias cdi="cd ~/dev/projects/prototypes"

alias t="tmux"
alias ta="tmux attach-session -t"
alias tls="tmux list-sessions"

HISTCONTROL=ignorespace

# uber fancy kick you in the butt prompt
PS1=$'\e[0;36m[%n@%m %~]\e[0m
$'

PATH=/usr/local/bin:$HOME/bin:$PATH

# add my identity
alias github-prep="ssh-add ~/.ssh/id_rsa.github"

[ -f ~/.fzf.zsh ] && source ~/.fzf.zsh
