#!/bin/bash

set -ouex pipefail

# Set variables
OS_VERSION=$(rpm -E %fedora)

# Install packages
dnf5 -y install \
    android-tools \
    kdepim-addons \
    kmousetool \
    konsole \
    kontact \
    pipx \
    podlet \
    podman-tui \
    python3-ramalama \
    rclone \
    restic \
    syncthing \
    yakuake

# Install COPR packages
dnf5 -y install --enable-repo="copr:copr.fedorainfracloud.org:ublue-os:packages" \
    ublue-setup-services

# Install 3rd party packages
dnf5 -y config-manager addrepo --from-repofile="https://download.opensuse.org/repositories/home:mkittler/Fedora_${OS_VERSION}/home:mkittler.repo"
dnf5 -y config-manager setopt home_mkittler.enabled=0
dnf5 -y install --enable-repo="home_mkittler" \
    syncthingplasmoid-qt6

dnf5 -y config-manager addrepo --set=baseurl="https://packages.microsoft.com/yumrepos/vscode" --id="vscode"
dnf5 -y config-manager setopt vscode.enabled=0
dnf5 -y config-manager setopt vscode.gpgcheck=0 # FIXME: gpgcheck is broken for vscode
dnf5 -y install --nogpgcheck --enable-repo="vscode" \
    code

# Remove packages
dnf5 -y remove \
    lutris \
    ptyxis