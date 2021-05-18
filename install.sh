#!/bin/bash

set -x

echo "$(pwd)"

ln -s $(pwd)/.tmux.conf $HOME/.tmux.conf
ln -s $(pwd)/.tmuxline $HOME/.tmuxline
ln -s $(pwd)/.vimrc $HOME/.vimrc
ln -s $(pwd)/.vim $HOME/.vim
mkdir -p $HOME/.config
ln -s $(pwd)/.config/* $HOME/.config/

vim +PlugInstall +q
