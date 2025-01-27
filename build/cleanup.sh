#!/bin/bash

set -ouex pipefail

# Disable Fedora telemetry
# https://docs.projectbluefin.io/analytics/#fedora
systemctl mask rpm-ostree-countme.timer

# Disable connectivity check
# https://www.ctrl.blog/entry/network-connection-http-checks.html
# https://wiki.archlinux.org/title/NetworkManager#Checking_connectivity
tee /etc/NetworkManager/conf.d/20-connectivity.conf <<EOF
[connectivity]
enabled=false
EOF

# Clean temp files
dnf5 clean all
rm -rf /tmp/* || true
rm -rf /var/!(cache)
rm -rf /var/cache/!(rpm-ostree)