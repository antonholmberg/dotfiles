#!/usr/bin/env bash

if [ ! -s $HOME/.antigen.zsh ]
then
  echo "Downloading antigen..."
  curl -L git.io/antigen > $HOME/.antigen.zsh
fi

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

# Install zshrc
if [ -e $HOME/.zshrc ]
then
  echo "Previous zshrc found, skipping..."
else
  echo "Linking zshrc..."
  ln -s $PWD/.zshrc $HOME/
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
  if [ -e $HOME/.config/alacritty/alacritty.toml ]
  then
    echo "Previous alacritty config file exists, skipping..."
  else
    echo "Linking alacritty config..."
    ln -s $PWD/alacritty/alacritty.toml $HOME/.config/alacritty
  fi

  if [ -e $HOME/.config/alacritty/catppuccin-mocha.toml ]
  then
    echo "Previous catppuccin config file exists, skipping..."
  else
    echo "Linking catppuccin-mocha theme..."
    ln -s $PWD/alacritty/catppuccin-mocha.toml $HOME/.config/alacritty
  fi
else
  echo "Alacritty not installed, skipping..."
fi
