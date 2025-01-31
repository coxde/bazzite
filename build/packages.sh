#!/bin/bash

set -ouex pipefail

# Set variables
OS_VERSION=$(rpm -E %fedora)

# Install packages
dnf5 -y install kgpg kmousetool kontact ksystemlog yakuake syncthing

# Install COPR packages
dnf5 -y copr enable ublue-os/staging

dnf5 -y install uupd

# Install 3rd party packages
dnf5 -y config-manager addrepo --from-repofile="https://download.opensuse.org/repositories/home:mkittler/Fedora_${OS_VERSION}/home:mkittler.repo"

dnf5 -y install syncthingplasmoid-qt6

# Remove packages
dnf5 -y remove lutris