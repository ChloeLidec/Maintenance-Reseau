#!/bin/bash

# Reset
COLOR_OFF='\033[0m'       # Text Reset

# Regular Colors
RED='\033[0;31m'          # Red
GREEN='\033[0;32m'        # Green

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
        if [ "$choice" == "Python" ]; then
            sudo apt install -y python3
            sudo apt install -y python3-pip
            echo -e "${GREEN} Python installation done ${COLOR_OFF}"
        elif [ "$choice" == "Basic python vscode extension" ]; then
            if [ ! -x "$(command -v code)" ]; then
                echo -e "${YELLOW} Visual Studio Code is going to be installed to proceed. ${COLOR_OFF}"
                sudo snap install code --classic
            fi
            code --install-extension ms-python.python
            echo -e "${GREEN} Basic python vscode extension installation done ${COLOR_OFF}"
        elif [ "$choice" == "Autodocstring vscode extension" ]; then
            if [ ! -x "$(command -v code)" ]; then
                echo -e "${YELLOW} Visual Studio Code is going to be installed to proceed. ${COLOR_OFF}"
                sudo snap install code --classic
            fi
            code --install-extension njpwerner.autodocstring
            echo -e "${GREEN} Autodocstring installation done ${COLOR_OFF}"
        elif [ "$choice" == "Pylance vscode extension" ]; then
            if [ ! -x "$(command -v code)" ]; then
                echo -e "${YELLOW} Visual Studio Code is going to be installed to proceed. ${COLOR_OFF}"
                sudo snap install code --classic
            fi
            code --install-extension ms-python.vscode-pylance
            echo -e "${GREEN} Pylance installation done ${COLOR_OFF}"
        elif [ "$choice" == "Pytest" ]; then
            sudo apt install -y python3-pytest
            echo -e "${GREEN} Pytest installation done ${COLOR_OFF}"
        elif [ "$choice" == "Pylint" ]; then
            sudo apt install -y pylint
            echo -e "${GREEN} Pylint installation done ${COLOR_OFF}"
        elif [ "$choice" == "Pygame" ]; then
            pip install pygame
            echo -e "${GREEN} Pygame installation done ${COLOR_OFF}"
        fi
    done
    echo -e "${GREEN} Installation complete ${COLOR_OFF}"
else
    echo -e " ${RED} User selected Cancel. ${COLOR_OFF}"
fi