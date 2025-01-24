# Bazzite 🔮

## Purpose 🤔

This repository is for my personal OS image, very much based on my own needs. It's based on [Bazzite](https://bazzite.gg/) and a template published by the [Universal Blue](https://universal-blue.org/) Project.

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

ISOs will be manually published to [GitHub Artifacts](https://github.com/coxde/bazzite/actions/workflows/build-iso.yml). May move to other storage (one day™).

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
-   [main](https://github.com/ubazzite/main/)
-   [m2os](https://github.com/m2giles/m2os)
