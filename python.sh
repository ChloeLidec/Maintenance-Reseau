#!/bin/bash

# Reset
COLOR_OFF='\033[0m'       # Text Reset

# Regular Colors
RED='\033[0;31m'          # Red
GREEN='\033[0;32m'        # Green

# sudo apt-get update && sudo apt-get upgrade -y -> cette ligne sera faite dans le programme principal

eval SELECTION=( $(whiptail --title "Python" \
--checklist "Choose what you want to install" 25 80 8 \
"Python" "" ON \
"Basic python vscode extension" "" OFF \
"Autodocstring vscode extension" "" OFF \
"Pylance vscode extension" "" OFF \
"Pytest" "" OFF \
"Pylint" "" OFF \
"Pygame" "" OFF 3>&1 1>&2 2>&3))

if [ "${#SELECTION[@]}" != 0 ]; then
    for choice in "${SELECTION[@]}"; do
        if [ $choice == "Python" ]; then
            sudo apt install -y python3
            sudo apt install -y python3-pip
        elif [ $choice == "Basic python vscode extension" ]; then
            code --install-extension ms-python.python
        elif [ $choice == "Autodocstring vscode extension" ]; then
            code --install-extension njpwerner.autodocstring
        elif [ $choice == "Pylance vscode extension" ]; then
            code --install-extension ms-python.vscode-pylance
        elif [ $choice == "Pytest" ]; then
            sudo apt install -y python3-pytest
        elif [ $choice == "Pylint" ]; then
            sudo apt install -y pylint
        elif [ $choice == "Pygame" ]; then
            pip install pygame
        fi
    done
    echo -e "${GREEN} Installation complete ${COLOR_OFF}"
else
    echo -e " ${RED} User selected Cancel. ${COLOR_OFF}"
fi

