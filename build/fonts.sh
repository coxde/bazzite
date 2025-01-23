#!/bin/bash

set -ouex pipefail

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