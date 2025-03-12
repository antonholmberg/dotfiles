#!/usr/bin/env bash

# Install NeoVim config.
if command -v nvim 2>&1 >/dev/null 
then
  [ -d $HOME/.config/nvim ] || mkdir -p $HOME/.config/nvim
  if [ -e $HOME/.config/nvim/init.lua ]
  then
	  echo "Previous Neovim config found, skipping..."
  else
    "Linking vim config..."
	  ln -s $PWD/nvim/init.lua $HOME/.config/nvim
  fi
else
  echo "NeoVim is not installed, skipping..."
fi

# Install bashrc
if [ -e $HOME/.bashrc ]
then
  echo "Previous bashrc found, skipping..."
else
  echo "Linking bashrc..."
  ln -s $PWD/.bashrc $HOME/
fi

# Install bash_profile
if [ -e $HOME/.bash_profile ]
then
  echo "Previous bash_profile found, skipping..."
else
  echo "Linking bash_profile..."
  ln -s $PWD/.bash_profile $HOME/
fi

# Install tmux config.
if command -v tmux 2>&1 > /dev/null
then
  [ -d $HOME/.config/tmux ] || mkdir -p $HOME/.config/tmux
  if [ -e $HOME/.config/tmux/tmux.conf ]
  then
    echo "Previous tmux config found, skipping..."
  else
    ln -s $PWD/tmux/tmux.conf $HOME/.config/tmux
  fi
else
  echo "Tmux is not installed, skipping..."
fi

# Install alacritty config.
if command -v alacritty 2>&1 > /dev/null
then
  [ -d $HOME/.config/alacritty ] || mkdir -p $HOME/.config/alacritty
  if [ -e $HOME/.config/alacritty/alacritty.yml ]
  then
    echo "Previous alacritty config file exists, skipping..."
  else
    echo "Linking alacritty config..."
    ln -s $PWD/alacritty/alacritty.yml $HOME/.config/alacritty
  fi

  [ -d $HOME/.config/alacritty/catppuccin ] || mkdir -p $HOME/.config/alacritty/catppuccin

  if [ -e $HOME/.config/alacritty/catppuccin/catppuccin-mocha.yml ]
  then
    echo "Previous catppuccin config file exists, skipping..."
  else
    echo "Linking catppuccin-mocha theme..."
    ln -s $PWD/alacritty/catppuccin/catppuccin-mocha.yml $HOME/.config/alacritty/catppuccin
  fi
else
  echo "Alacritty not installed, skipping..."
fi
