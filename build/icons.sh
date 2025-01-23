#!/bin/bash

set -ouex pipefail

# Install Papirus Icon Theme
wget -qO- https://git.io/papirus-icon-theme-install | sh

# Install Papirus Folders and 
wget -qO- https://git.io/papirus-folders-install | sh
papirus-folders -C nordic # Hardcode Nordic color (read-only system)