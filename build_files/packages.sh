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
dnf5 -y config-manager addrepo --from-repofile="https://download.opensuse.org/repositories/home:mkittler/Fedora_${OS_VERSION}/home:mkittler.repo" --id="syncthing"
dnf5 -y config-manager setopt syncthing.enabled=0
dnf5 -y install --enable-repo="syncthing" \
    syncthingplasmoid-qt6

dnf5 -y config-manager addrepo --set=baseurl="https://packages.microsoft.com/yumrepos/vscode" --id="vscode"
dnf5 -y config-manager setopt vscode.enabled=0
dnf5 -y install --enable-repo="vscode" \
    code

# Remove packages
dnf5 -y remove \
    lutris \
    ptyxis