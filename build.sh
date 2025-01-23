#!/bin/bash

set -ouex pipefail

### Install packages
# Set variables
OS_VERSION=$(rpm -E %fedora)

# Install packages
dnf5 install -y kcm-fcitx5 kgpg kmousetool kontact merkuro yakuake syncthing

# Install COPR packages

# Install 3rd party packages
curl -fLs --create-dirs \
https://download.opensuse.org/repositories/home:mkittler/Fedora_${OS_VERSION}/home:mkittler.repo \
-o /etc/yum.repos.d/download.opensuse.org.repositories.home:mkittler.Fedora_${OS_VERSION}.home:mkittler.repo

dnf5 install -y syncthingplasmoid-qt6

### Remove packages
dnf5 remove -y lutris

### Install fonts
# Set variables
FONT=JetBrainsMono
URL="https://github.com/ryanoasis/nerd-fonts/releases/latest/download"
DEST="/usr/share/fonts/nerd-fonts"

# Download fonts
curl -fLs --create-dirs "${URL}/JetBrainsMono.tar.xz" -o "/tmp/fonts/${FONT}.tar.xz"

# Copy fonts
mkdir -p "${DEST}/${FONT}"
tar -xf "/tmp/fonts/${FONT}.tar.xz" -C "${DEST}/${FONT}"

# Post-install
rm -rf /tmp/fonts
fc-cache --system-only --really-force "${DEST}"

### Install icons
# Install Papirus Icon Theme
wget -qO- https://git.io/papirus-icon-theme-install | sh

# Install Papirus Folders and 
wget -qO- https://git.io/papirus-folders-install | sh
papirus-folders -C nordic # Hardcode Nordic color (read-only system)