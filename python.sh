#!/bin/bash

# Reset
Color_Off='\033[0m'       # Text Reset

# Regular Colors
Black='\033[0;30m'        # Black
Red='\033[0;31m'          # Red
Green='\033[0;32m'        # Green
Yellow='\033[0;33m'       # Yellow
Blue='\033[0;34m'         # Blue
Purple='\033[0;35m'       # Purple
Cyan='\033[0;36m'         # Cyan
White='\033[0;37m'
sudo apt-get update && sudo apt-get upgrade -y
sudo apt install -y python3-pip

selection = $(whiptail --title "Python" --checklist \
"Choose what you want to install" 15 60 4 \
"Basic python vscode extension" "" ON \
"Autodocstring vscode extension" "" OFF \
"Pylance vscode extension" "" OFF \
"Pytest" "" OFF \
"Pylint" "" OFF \
"Pygame" "" OFF 3>&1 1>&2 2>&3)

exitstatus=$?
if [ $exitstatus = 0 ]; then
    array=($selection)
    for i in "${array[@]}"
        if $i == "Basic python vscode extension"; then
            code --install-extension ms-python.python
        elif $i == "Autodocstring vscode extension"; then
            code --install-extension njpwerner.autodocstring
        elif $i == "Pylance vscode extension"; then
            code --install-extension ms-python.vscode-pylance
        elif $i == "Pytest"; then
            sudo apt install -y python3-pytest
        elif $i == "Pylint"; then
            sudo apt install -y pylint
        elif $i == "Pygame"; then
            pip install pygame
        fi
else
    echo "${Red} User selected Cancel. ${Color_Off}"
fi

echo "${Green} Installation complete ${Color_Off}"