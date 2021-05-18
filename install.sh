#!/bin/bash

set -x

echo "$(pwd)"

ln -s .tmux.conf $HOME/.tmux.conf
ln -s .tmuxline $HOME/.tmuxline
ln -s .vimrc $HOME/.vimrc
ln -s .vim $HOME/.vim
mkdir -p $HOME/.config
ln -s .config/* $HOME/.config/

vim +PlugInstall +q
