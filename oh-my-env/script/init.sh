#!/usr/bin/env bash
export LC_ALL=C

function main() {
    cd $HOME && git clone https://github.com/eraserandrain/install.git
    source $HOME/install/include/common.sh
    if_jammy_os set_apt_mirror

    # Install
    install_env \
        --node \
        --python \
        --cpp \
        --zsh \
        --ssh

    # Load
    $HOME/install/zsh/update_local.sh -d
    source $HOME/.zshrc
}

# Main
main
