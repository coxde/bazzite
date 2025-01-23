# Install AppMan, a AppImage package manager (https://github.com/ivan-hc/AM)
install-appman ACTION="":
    #!/usr/bin/env bash
    source /usr/lib/ujust/ujust.sh
    IMAGE_INFO="/usr/share/ublue-os/image-info.json"
    IMAGE_NAME=$(jq -r '."image-name"' < $IMAGE_INFO)
    OPTION={{ ACTION }}
    if [ "$OPTION" == "help" ]; then
      echo "Usage: ujust install-appman <option>"
      echo "  <option>: Specify the quick option to skip the prompt"
      echo "  Use 'install' to select Install AppMan"
      exit 0
    elif [ "$OPTION" == "" ]; then
      echo "${bold}Install AppMan, a AppImage package manager${normal}"
      OPTION=$(Choose "Install AppMan")
    fi
    if [[ "${OPTION,,}" =~ ^install ]]; then
      wget -q -O /tmp/AM-INSTALLER https://raw.githubusercontent.com/ivan-hc/AM/main/AM-INSTALLER && chmod a+x /tmp/AM-INSTALLER && /tmp/AM-INSTALLER
    fi