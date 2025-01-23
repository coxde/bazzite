# Make fish the default shell
enable-fish ACTION="":
    #!/usr/bin/env bash
    source /usr/lib/ujust/ujust.sh
    IMAGE_INFO="/usr/share/ublue-os/image-info.json"
    IMAGE_NAME=$(jq -r '."image-name"' < $IMAGE_INFO)
    OPTION={{ ACTION }}
    if [ "$OPTION" == "help" ]; then
      echo "Usage: ujust enable-fish <option>"
      echo "  <option>: Specify the quick option to skip the prompt"
      echo "  Use 'enable' to select Enable Fish"
      echo "  Use 'reset' to select Reset to Bash"
      exit 0
    elif [ "$OPTION" == "" ]; then
      echo "${bold}Enable Fish${normal}"
      OPTION=$(Choose "Enable Fish" "Reset to Bash")
    fi
    if [[ "${OPTION,,}" =~ ^enable ]]; then
      sudo usermod --shell /usr/bin/fish ${USER}
    elif [[ "${OPTION,,}" =~ ^reset ]]; then
      sudo usermod --shell /usr/bin/bash ${USER}
    fi