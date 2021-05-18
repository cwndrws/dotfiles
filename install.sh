#!/bin/bash

set -x

echo "$(pwd)"

ln -s .tmux.conf
ln -s .tmuxline
ln -s .vimrc $HOME/.vimrc
ln -s .vim $HOME/.vim
mkdir -p $HOME/.config
ln -s .config/* $HOME/.config/

vim +PlugInstall +q
