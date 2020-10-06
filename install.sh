#!/usr/bin/env bash

main () {
    install_system_deps
    setup_zsh
    setup_nvim
}

install_system_deps () {
    if [ `whoami` != 'root' ]; then
        sudo apt-get --ignore-missing install -y neovim zsh fzf
    else
        apt-get --ignore-missing install -y neovim zsh fzf
    fi
}

setup_zsh () {
    install_oh_my_zsh
    replace_zshrc
}

setup_nvim () {
    install_pynvim
    install_vim_plug
    nvim_plugin_install
}

install_oh_my_zsh () {
    sh -c "$(curl -fsSL https://raw.githubusercontent.com/ohmyzsh/ohmyzsh/master/tools/install.sh)" "" --unattended
    chsh -s /usr/bin/zsh
    /usr/bin/zsh
}

replace_zshrc () {
    mv ~/.zshrc.pre-oh-my-zsh ~/.zshrc
    source ~/.zshrc
}

install_pynvim () {
    pip3 install pynvim
}

install_vim_plug () {
    sh -c 'curl -fLo "${XDG_DATA_HOME:-$HOME/.local/share}"/nvim/site/autoload/plug.vim --create-dirs \
          https://raw.githubusercontent.com/junegunn/vim-plug/master/plug.vim'
}

nvim_plugin_install () {
    nvim +UpdateRemotePlugins +PlugInstall +qall
}

if [ "$0" = "$BASH_SOURCE" ]; then
    set -e

    # keep track of the last executed command
    trap 'last_command=$current_command; current_command=$BASH_COMMAND' DEBUG
    # echo an error message before exiting
    trap 'echo "\"${last_command}\" command filed with exit code $?."' EXIT

    main
fi
