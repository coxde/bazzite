#!/bin/bash

set -ouex pipefail

# Set variables
OS_VERSION=$(rpm -E %fedora)

# Install packages
dnf5 -y install \
    kdepim-addons \
    kmousetool \
    konsole \
    kontact \
    python3-ramalama \
    syncthing \
    yakuake

# Install COPR packages

# Install 3rd party packages
dnf5 -y config-manager addrepo --from-repofile="https://download.opensuse.org/repositories/home:mkittler/Fedora_${OS_VERSION}/home:mkittler.repo"

dnf5 -y install \
    syncthingplasmoid-qt6

# Remove packages
dnf5 -y remove \
    lutris \
    ptyxis