# Bazzite 🔮

[![Build Image](https://github.com/coxde/bazzite/actions/workflows/build.yml/badge.svg)](https://github.com/coxde/bazzite/actions/workflows/build.yml)

## Purpose 🤔

This repository is for my personal OS image, very much based on my own needs. It's based on [Bazzite](https://github.com/ublue-os/bazzite/) and a template published by the [Universal Blue](https://universal-blue.org/) Project.

## Features ✨

-   Extra [packages](https://github.com/coxde/bazzite/blob/main/build_files/packages.sh)
-   More [Justfiles](https://github.com/coxde/bazzite/tree/main/build_files/just)
-   Fonts and icons
-   LibreWolf tweaks

## Installation ⚙️

### Rebase

To rebase an existing atomic Fedora installation to the latest build:

-   First rebase to the unsigned image, to get the proper signing keys and policies installed:
    ```
    rpm-ostree rebase ostree-unverified-registry:ghcr.io/coxde/bazzite:latest
    ```
-   Reboot to complete the rebase:
    ```
    systemctl reboot
    ```
-   Then rebase to the signed image, like so:
    ```
    rpm-ostree rebase ostree-image-signed:docker://ghcr.io/coxde/bazzite:latest
    ```
-   Reboot again to complete the installation
    ```
    systemctl reboot
    ```

The `latest` tag will automatically point to the latest build.

### ISO

TODO: https://github.com/ublue-os/image-template/commit/eb0cc45977b7dc47656c117a9ed34cfd66857912

## Verification ✅

These images are signed with [Sigstore](https://www.sigstore.dev/)'s [cosign](https://github.com/sigstore/cosign). You can verify the signature by downloading the `cosign.pub` file from this repo and running the following command:

```bash
cosign verify --key cosign.pub ghcr.io/coxde/bazzite
```

## Credits 💌

-   [Universal Blue](https://universal-blue.org/)
-   [BlueBuild](https://blue-build.org/)
-   [Aurora](https://getaurora.dev/)
-   [Bazzite](https://bazzite.gg/)
-   [Bluefin](https://projectbluefin.io/)
-   [m2os](https://github.com/m2giles/m2os)
