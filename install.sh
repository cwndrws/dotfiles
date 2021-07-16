#!/bin/bash

exec > >(tee -i $HOME/creation.log)
exec 2>&1
set -x

# Install Nix
curl -L https://nixos.org/nix/install | sh

# Install Nix Home Manager
if ! which home-manager > /dev/null; then
  nix-channel --add https://github.com/nix-community/home-manager/archive/master.tar.gz home-manager
  nix-channel --udpate

  nix-shell '<home-manager>' -A install
fi

# link nix home file
default_nix_home_file="${HOME}/.config/nixpkgs/home.nix"
if [[ -n "${default_nix_home_file}" ]]; then
    rm -rf "${default_nix_home_file}"
fi
mkdir -p ${HOME}/.config/nixpkgs
ln -s $(pwd)/nix/home.nix "${default_nix_home_file}"

# Execute nix switch
home-manager switch

if [[ ! -z "$CODESPACES" ]]; then
    echo 'set -g default-terminal "xterm-256color"' >> $HOME/.tmux.conf
fi
