#!/bin/bash

#!/bin/bash

# Reset
COLOR_OFF='\033[0m'       # Text Reset

# Regular Colors
RED='\033[0;31m'          # Red
GREEN='\033[0;32m'        # Green
YELLOW='\033[0;33m'       # Yellow
BLUE='\033[0;34m'         # Blue

eval SELECTION=( $(whiptail --title "Visual Studio Code" --checklist \
"Choose what you want to install" 25 80 8 \
"Visual Studio Code" "" ON \
"GitHub Copilot" "" OFF \
"PDF Viewer" "" OFF \
"SonarLint" "" OFF 3>&1 1>&2 2>&3))

if [ "${#SELECTION[@]}" != 0 ]; then
    for choice in "${SELECTION[@]}"; do
        if [ "$choice" == "Visual Studio Code" ]; then
            sudo snap install code --classic
            echo -e "${GREEN} Visual Studio Code installation done ${COLOR_OFF}"
        elif [ "$choice" == "GitHub Copilot" ]; then
            code --install-extension github.copilot
            echo -e "${GREEN} GitHub Copilot installation done ${COLOR_OFF}"
        elif [ "$choice" == "PDF Viewer" ]; then
            code --install-extension tomoki1207.pdf
            echo -e "${GREEN} PDF Viewer installation done ${COLOR_OFF}"
        elif [ "$choice" == "SonarLint" ]; then
            code --install-extension sonarsource.sonarlint-vscode
            echo -e "${GREEN} SonarLint installation done ${COLOR_OFF}"
        fi
    done
    echo -e "${GREEN} Installation complete ${COLOR_OFF}"
else
    echo -e " ${RED} User selected Cancel. ${COLOR_OFF}"
fi