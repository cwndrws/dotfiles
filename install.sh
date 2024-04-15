#!/bin/bash

exec > >(tee -i $HOME/creation.log)
exec 2>&1
set -x

NIX_VERSION="2.21.1"
BACKUP_DIR="${HOME}/backup"

main () {
    setup_nix
}

setup_nix () {
    if [[ "$UID" -eq "0" ]]; then
        setup_nixbld_users
    fi

    setup_nix_dirs
    setup_build_users_config
    setup_sandbox_config
    setup_tmpdir_setting
    source_nix_in_shell
    install_nix
    move_existing_files_to_backup
    set_nix_pkg_priority
    setup_home_manager_files
    install_home_manager
    set_default_shell
    add_nix_profile_to_path
    add_tmpdir_to_zshrc
}

profile_bin_path () {
    if [[ "$UID" -eq "0" ]]; then
	echo -n "/nix/var/nix/profiles/default/bin"
    else
        echo -n "${HOME}/.nix-profile/bin"
    fi
}

setup_build_users_config () {
    local build_users_setting_for_root='build-users-group = nixbld'
    local build_users_setting_for_nonroot='build-users-group = '

    if [[ "$UID" -eq "0" ]]; then
        local build_users_setting="${build_users_setting_for_root}"
    else
        local build_users_setting="${build_users_setting_for_nonroot}"
    fi

    ensure_line_in_file "${build_users_setting}" '/etc/nix/nix.conf'
}

setup_nixbld_users () {
    # If we're running as root in the codespace or whereever we're installing
    # this, we want to setup nonroot users to build nix derivations, so we
    # aren't executing untrusted code as root. This is probably not that much
    # protection from something bad happening, but better than nothing
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
    if [[ "$UID" -eq "0" ]]; then
        mkdir -m 0755 -p \
            /etc/nix \
            /nix \
            /nixtmp
    else
        $(privileged_cmd_prefix)mkdir -m 0755 -p \
            /etc/nix \
            /nixtmp
        $(privileged_cmd_prefix)chown $(whoami) /nixtmp
    fi
}

setup_sandbox_config () {
    ensure_line_in_file 'sandbox = false' '/etc/nix/nix.conf'
}

setup_tmpdir_setting () {
    # Because of the way codespaces mounts the root dir and tmp dir, I have to
    # create a tmp dir on the root drive so they're seen as being on the same
    # filesystem. This is because nix uses a tmp dir to do some build actions
    # and then just does a rename into the nix store. This is only possible
    # when the nix store and the tmpdir are on the same filesystem.
    ensure_line_in_file 'export TMPDIR="/nixtmp"' '/etc/profile'
}

download_and_verify_nix_installer () {
    pushd /tmp
    wget https://nixos.org/releases/nix/nix-${NIX_VERSION}/nix-${NIX_VERSION}-$(uname -m)-linux.tar.xz
    tar xf nix-${NIX_VERSION}-$(uname -m)-linux.tar.xz
    popd
}

run_nix_installer () {
    pushd /tmp
    USER="$(whoami)" sh nix-${NIX_VERSION}-$(uname -m)-linux/install
    # USER="$(whoami)" sh "/tmp/install-nix-${NIX_VERSION}" --no-daemon
    rm -r nix-${NIX_VERSION}-$(uname -m)-linux*
    $(profile_bin_path)/nix-collect-garbage --delete-old
    $(profile_bin_path)/nix-store --optimise
    $(profile_bin_path)/nix-store --verify --check-contents
    $(profile_bin_path)/nix-env --version
    popd
}

install_nix () {
    if ! which nix-env > /dev/null; then
        download_and_verify_nix_installer
        run_nix_installer
    fi
}

source_nix_in_shell () {
    ensure_line_in_file 'source ${HOME}/.nix-profile/etc/profile.d/nix.sh' '/etc/profile'
}

ensure_line_in_file () {
    local line="$1"
    local file="$2"
    if [[ -n "${file}" ]] && ! grep -q "${line}" "${file}"; then
        echo "${line}" | $(privileged_cmd_prefix)tee -a "${file}"
    fi

}

set_nix_pkg_priority () {
    $(profile_bin_path)/nix-env --set-flag priority 4 nix
}

setup_home_manager_files () {
    mkdir -p "${HOME}/.config/home-manager/"
    setup_user_file
    ln -s "$(pwd)/home.nix" "${HOME}/.config/home-manager/home.nix"
}

setup_user_file () {
    echo "{ username = \"$(whoami)\"; homeDirectory = \"${HOME}\"; }" > "$(pwd)/user.nix"
}

move_existing_files_to_backup () {
    move_to_backup "${HOME}/.zshrc"
}

move_to_backup () {
    local file="$1"
    if [[ -n "${file}" ]]; then
        mv $file $BACKUP_DIR
    else
        echo "${file}: no such file to backup"
    fi
}

install_home_manager () {
    $(profile_bin_path)/nix-channel --add https://github.com/nix-community/home-manager/archive/master.tar.gz home-manager
    $(profile_bin_path)/nix-channel --update
    export NIX_PATH=/nix/var/nix/profiles/per-user/$(whoami)/channels
    export PATH=$PATH:$(profile_bin_path)/
    export TMPDIR="/nixtmp"
    export USER="$(whoami)"
    $(profile_bin_path)/nix-shell '<home-manager>' -A install -b backup
}

set_default_shell () {
    sudo chsh -s "${HOME}/.nix-profile/bin/zsh" "$(whoami)"
}

add_nix_profile_to_path () {
    ensure_line_in_file 'export PATH="${HOME}/.nix-profile/bin/:${PATH}"' "${HOME}/.zshrc"
}

add_tmpdir_to_zshrc () {
    ensure_line_in_file 'export TMPDIR=/nixtmp' "${HOME}/.zshrc"
}

if [[ "${BASH_SOURCE}" = "$0" ]]; then
    main
fi
