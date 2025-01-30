# Install Nix via Determinate Nix Installer
install-nix ACTION="":
    #!/usr/bin/env bash
    source /usr/lib/ujust/ujust.sh
    OPTION={{ ACTION }}

    if [ "$OPTION" == "help" ]; then
      echo "Usage: ujust install-nix <option>"
      echo "  <option>: Specify the option to skip the prompt"
      echo "  Options:"
      echo "    install         - Install Nix"
      echo "    uninstall       - Uninstall Nix"
      echo "    configure-fish  - Configure fish shell integration"
      exit 0
    elif [ "$OPTION" == "" ]; then
      echo "${bold}Install Nix via Determinate Nix Installer${normal}"
      OPTION=$(Choose "Install Nix" "Uninstall Nix" "Configure Fish")
    fi

    if [[ "${OPTION,,}" =~ ^install ]]; then
      echo "Installing Nix via Determinate Nix Installer..."
      curl -sL -o /tmp/nix-installer https://install.determinate.systems/nix/nix-installer-x86_64-linux
      chmod +x /tmp/nix-installer
      sudo /tmp/nix-installer install --no-confirm --diagnostic-endpoint=""
    elif [[ "${OPTION,,}" =~ ^uninstall ]]; then
      echo "Uninstalling Nix..."
      sudo /nix/nix-installer uninstall --no-confirm
      [ -f "${HOME}/.config/fish/conf.d/nix.fish" ] && rm -f "${HOME}/.config/fish/conf.d/nix.fish"
    elif [[ "${OPTION,,}" =~ ^configure ]]; then
      echo "Configuring fish shell integration..."
      tee "${HOME}/.config/fish/conf.d/nix.fish" <<EOF
      # Nix
      if test -e '/nix/var/nix/profiles/default/etc/profile.d/nix-daemon.fish'
          source '/nix/var/nix/profiles/default/etc/profile.d/nix-daemon.fish'
      end
      # End Nix
      EOF
    fi