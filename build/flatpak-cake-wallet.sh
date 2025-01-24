#!/bin/bash
# Install Cake Wallets

set -ouex pipefail

# Create the systemd service for Flatpak install
tee /usr/lib/systemd/system/flatpak-cake-wallet-install.service <<EOF
[Unit]
Description=Install Cake Wallet
ConditionPathExists=!/etc/.%N.stamp
After=network-online.target

[Service]
Type=oneshot
ExecStart=/usr/libexec/flatpak-cake-wallet-install.sh
ExecStop=/usr/bin/touch /etc/.%N.stamp

[Install]
WantedBy=default.target multi-user.target
EOF

# Create the Flatpak install script
tee /usr/libexec/flatpak-cake-wallet-install.sh <<EOF
#!/usr/bin/bash

mkdir /tmp/cake_wallet
cd /tmp/cake_wallet
wget "$(curl -s https://api.github.com/repos/cake-tech/cake_wallet/releases/latest | grep -oP '"browser_download_url": "\K[^"]+' | grep 'Linux.flatpak')"

flatpak install -y --bundle ./*.flatpak

rm -rf /tmp/cake_wallet
EOF

# Make the script executable
chmod +x /usr/libexec/flatpak-cake-wallet-install.sh

# Enable the systemd service
systemctl enable flatpak-cake-wallet-install.service

