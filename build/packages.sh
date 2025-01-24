#!/bin/bash

set -ouex pipefail

# Set variables
OS_VERSION=$(rpm -E %fedora)

# Install packages
dnf5 install -y kcm-fcitx5 kgpg kmousetool kontact yakuake syncthing

# Install COPR packages


# Install 3rd party packages
curl -fLs --create-dirs \
https://download.opensuse.org/repositories/home:mkittler/Fedora_${OS_VERSION}/home:mkittler.repo \
-o /etc/yum.repos.d/download.opensuse.org.repositories.home:mkittler.Fedora_${OS_VERSION}.home:mkittler.repo

dnf5 install -y syncthingplasmoid-qt6

# Remove packages
dnf5 remove -y lutris