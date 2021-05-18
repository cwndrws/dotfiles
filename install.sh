#!/bin/bash

exec > >(tee -i $HOME/creation.log)
exec 2>&1
set -x

echo "$(pwd)"

echo "$CODESPACES"

ln -s $(pwd)/.tmux.conf $HOME/.tmux.conf
ln -s $(pwd)/.tmuxline $HOME/.tmuxline
ln -s $(pwd)/.vimrc $HOME/.vimrc
ln -s $(pwd)/.vim $HOME/.vim
mkdir -p $HOME/.config
ln -s $(pwd)/.config/* $HOME/.config/

vim +PlugInstall +q
