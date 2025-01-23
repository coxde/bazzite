#!/bin/bash

set -ouex pipefail

echo "::group:: ===== Manage Packages ====="
/ctx/build/packages.sh
echo "::endgroup::"

echo "::group:: ===== Run Scripts ====="
/ctx/build/flatpak-cake-wallet.sh
/ctx/build/flatpak-librewolf-keepassxc.sh
echo "::endgroup::"

echo "::group:: ===== Install Fonts ====="
/ctx/build/fonts.sh
echo "::endgroup::"

echo "::group:: ===== Install Icons ====="
/ctx/build/icons.sh
echo "::endgroup::"

echo "::group:: ===== Include Just Recipes ====="
/ctx/build/just.sh
echo "::endgroup::"

echo "::group:: ===== Replace Image Info ====="
/ctx/build/image-info.sh
echo "::endgroup::"
