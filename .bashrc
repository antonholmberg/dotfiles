command -v nvim 2>&1 >/dev/null && alias vim=nvim
alias l=ls
command -v tmux 2>&1 > /dev/null && alias tmux='TERM=xterm-256color tmux -f "$XDG_CONFIG_HOME"/tmux/tmux.conf'
export PATH=/opt/spotify-devex/bin:$PATH
alias ls='ls -G'

HOME_BREW_BASH_COMPLETION=$HOMEBREW_PREFIX/etc/profile.d/bash_completion.sh
ROOT_BASH_COMPLETION=$HOMEBREW_PREFIX/etc/profile.d/bash_completion.sh
[ -s $HOME_BREW_BASH_COMPLETION ] && . "$HOME_BREW_BASH_COMPLETION"
