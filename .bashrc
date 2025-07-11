command -v nvim 2>&1 >/dev/null && alias vim=nvim
alias l=ls
command -v tmux 2>&1 > /dev/null && alias tmux='TERM=xterm-256color tmux -f "$XDG_CONFIG_HOME"/tmux/tmux.conf'
alias ls='ls -G'
if [ -x $(command -v pyenv) ]
then
  alias python="$(pyenv which python)"
  alias pip="$(pyenv which pip)"
fi

HOME_BREW_BASH_COMPLETION=$HOMEBREW_PREFIX/etc/profile.d/bash_completion.sh
ROOT_BASH_COMPLETION=$HOMEBREW_PREFIX/etc/profile.d/bash_completion.sh
[ -s $HOME_BREW_BASH_COMPLETION ] && . "$HOME_BREW_BASH_COMPLETION"

# Set up fzf terminal tools
# Run `$(brew --prefix)/opt/fzf/install` to generate.
[ -f ~/.fzf.bash ] && source ~/.fzf.bash

export PATH=$PATH:/Users/aholmberg/.local/bin
export PATH=/opt/spotify-devex/bin:$PATH
