#!/bin/bash

set -x

echo "$(pwd)"

ln -s $HOME/.tmux.conf .tmux.conf
ln -s $HOME/.tmuxline .tmuxline
ln -s $HOME/.vimrc .vimrc
ln -s $HOME/.vim .vim
mkdir -p $HOME/.config
ln -s $HOME/.config/ .config/*

vim +PlugInstall +q
