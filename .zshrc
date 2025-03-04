source $HOME/.antigen.zsh

antigen use oh-my-zsh
antigen theme robbyrussell
antigen apply

export XDG_CONFIG_HOME="$HOME/.config"

# Set up SDK Man if it is installed.
# see https://sdkman.io/
export SDKMAN_DIR="$HOME/.sdkman"
[ -s "$SDKMAN_DIR/bin/sdkman-init.sh" ] && source "$SDKMAN_DIR/bin/sdkman-init.sh"

# Set up nvm if installed.
# See https://github.com/nvm-sh/nvm
export NVM_DIR="$HOME/.nvm"
[ -s "$NVM_DIR/nvm.sh" ] && . "$NVM_DIR/nvm.sh"
[ -s "$NVM_DIR/bash_completion" ] && source "$NVM_DIR/bash_completion"

# Set up pyenv if installed.
# See https://github.com/pyenv/pyenv
export PYENV_ROOT="$HOME/.pyenv"
[ -d $PYENV_ROOT/bin ] && export PATH="$PYENV_ROOT/bin:$PATH"
eval "$(pyenv init - bash)"

# Set up spt cli if installed.
SPT_TOOL=$HOME/.local/bin
[ -d $SPT_TOOL ] && export PATH=$PATH:$SPT_TOOL

# Set up Spotify android sdk, if installed.
SPOTIFY_ANDROID_HOME=$HOME/.vulcan/cache/commandlinetools-mac-6858069_latest.zip-9442ad74b2d40ddb9c00459dd7dc096c5dffdf18/extracted
[ -d $SPOTIFY_ANDROID_HOME ] && export ANDROID_HOME=$SPOTIFY_ANDROID_HOME

if [ -z "$ANDROID_HOME" ] 
then
  export PATH=$PATH:$ANDROID_HOME/emulator
  export PATH=$PATH:$ANDROID_HOME/platform-tools
fi

# Set up spotify developer tools if installed.
SPOTIFY_DEVEX=/opt/spotify-devex/bin
[ -d $SPOTIFY_DEVEX ] && export PATH=$PATH:$SPOTIFY_DEVEX

command -v nvim 2>&1 >/dev/null && alias vim=nvim
alias l=ls
command -v tmux 2>&1 > /dev/null && alias tmux='TERM=xterm-256color tmux -f "$XDG_CONFIG_HOME"/tmux/tmux.conf'
export PATH=/opt/spotify-devex/bin:$PATH
