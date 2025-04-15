# Install AppMan, a AppImage package manager (https://github.com/ivan-hc/AM)
install-appman ACTION="":
    #!/usr/bin/env bash
    source /usr/lib/ujust/ujust.sh
    OPTION={{ ACTION }}

    if [ "$OPTION" == "help" ]; then
      echo "Usage: ujust install-appman <option>"
      echo "  <option>: Specify the quick option to skip the prompt"
      echo "  Options:"
      echo "    install     - Install AppMan"
      exit 0
    elif [ "$OPTION" == "" ]; then
      echo "${bold}Install AppMan, a AppImage package manager${normal}"
      OPTION=$(Choose "Install AppMan")
    fi

    if [[ "${OPTION,,}" =~ ^install ]]; then
      echo "Installing AppMan..."
      wget -q -O /tmp/AM-INSTALLER https://raw.githubusercontent.com/ivan-hc/AM/main/AM-INSTALLER && chmod a+x /tmp/AM-INSTALLER && /tmp/AM-INSTALLER
    fi