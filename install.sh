#!/bin/bash

exec > >(tee -i $HOME/creation.log)
exec 2>&1
set -x

NIX_VERSION="2.3.15"

main () {
    setup_nix
    install_home_manager
    run_home_manager
    make_tmux_work_in_codespaces
}

setup_nix () {
    if [[ "$UID" -eq "0" ]]; then
        setup_nixbld_users
    fi

    setup_nix_dirs

    if [[ "$UID" -eq "0" ]]; then
        setup_build_users_config
    fi

    link_nix_config
    install_nix
}

setup_build_users_config () {
    local build_users_setting='build-users-group = nixbld'
    local default_nix_config_file="${HOME}/.config/nix/nix.conf"

    if [[ -n "${default_nix_config_file}" ]] && ! grep -q "${build_users_setting}" "${default_nix_config_file}"; then
        echo "${build_users_setting}" >> "${default_nix_config_file}"
    fi
}

setup_nixbld_users () {
    local nixbld_group_name="nixbld"
    local nixbld_username_prefix="nixbld"
    if ! grep -q "${nixbld_group_name}" /etc/group; then
        $(privileged_cmd_prefix)groupadd -g 30000 --system "${nixbld_group_name}"
    fi

    for i in $(seq 1 32); do
        local username="${nixbld_username_prefix}${i}"
        if ! id "${username}" > /dev/null; then
            $(privileged_cmd_prefix)useradd \
                --home-dir /var/empty \
                --gid 30000 \
                --groups nixbld \
                --no-user-group \
                --system \
                --shell /usr/sbin/nologin \
                --uid $((30000 + i)) \
                --password "!" \
                "${username}"
        fi
    done
}

privileged_cmd_prefix () {
    if [[ "$UID" -eq "0" ]]; then
        echo -n ""
    else
        echo -n "sudo "
    fi
}

setup_nix_dirs () {
    mkdir -p \
        ${HOME}/.config/nix \
        ${HOME}/.config/nixpkgs
}

link_nix_config () {
    local default_nix_home_file="${HOME}/.config/nixpkgs/home.nix"

    if [[ -n "${default_nix_home_file}" ]]; then
        rm -rf "${default_nix_home_file}"
    fi

    ln -s $(pwd)/nix/home.nix "${default_nix_home_file}"
}

download_and_verify_nix_installer () {
    curl -o "/tmp/install-nix-${NIX_VERSION}" "https://releases.nixos.org/nix/nix-${NIX_VERSION}/install"
    curl -o "/tmp/install-nix-${NIX_VERSION}.asc" "https://releases.nixos.org/nix/nix-${NIX_VERSION}/install.asc"
    gpg2 --recv-keys B541D55301270E0BCF15CA5D8170B4726D7198DE
    gpg2 --verify "/tmp/install-nix-${NIX_VERSION}.asc"
}

run_nix_installer () {
    USER="$(whoami)" sh "/tmp/install-nix-${NIX_VERSION}" --no-daemon
    . "${HOME}/.nix-profile/etc/profile.d/nix.sh"
}

install_nix () {
    if ! which nix-env > /dev/null; then
        download_and_verify_nix_installer
        run_nix_installer
    fi
}

install_home_manager () {
    if ! which home-manager > /dev/null; then
        nix-channel --add https://github.com/nix-community/home-manager/archive/master.tar.gz home-manager
        nix-channel --update

        nix-shell '<home-manager>' -A install
    fi
}

run_home_manager () {
    home-manager switch
}

make_tmux_work_in_codespaces () {
    local codespaces_tmux_default_terminal='set -g default-terminal "xterm-256color"'
    if [[ ! -z "$CODESPACES" ]] && ! grep -q "${codespaces_tmux_default_terminal}" "${HOME}/.tmux.conf"; then
        echo "${codespaces_tmux_default_terminal}" >> "${HOME}/.tmux.conf"
    fi
}


if [[ "${BASH_SOURCE}" = "$0" ]]; then
    main
fi
