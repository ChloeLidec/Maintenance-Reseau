#!/bin/bash

# Reset
COLOR_OFF='\033[0m'       # Text Reset

# Regular Colors
RED='\033[0;31m'          # Red
GREEN='\033[0;32m'        # Green
YELLOW='\033[0;33m'       # Yellow
BLUE='\033[0;34m'         # Blue

eval SELECTION=$(whiptail --title "Flask" --checklist \
"Choose what you want to install" 25 80 8 \
"Flask" "" ON \
"Virtual Env" "" OFF \
"Flask-SQLAlchemy" "" OFF \
"Flask-WTF" "" OFF \
"Flask-Login" "" OFF \
"Flask-Bootstrap" "" OFF \
"Python YAML" "" OFF 3>&1 1>&2 2>&3)

if [ "${#SELECTION[@]}" != 0 ]; then
    for choice in "${SELECTION[@]}"; do
        if [ "$choice" == "Flask" ]; then
            pip install flask
            echo -e "${GREEN} Flask installation done ${COLOR_OFF}"
        elif [ "$choice" == "Virtual Env" ]; then
            pip install python-dotenv
            echo -e "${GREEN} Virtual Env installation done ${COLOR_OFF}"
        elif [ "$choice" == "Flask-SQLAlchemy" ]; then
            pip install flask-sqlalchemy
            echo -e "${GREEN} Flask-SQLAlchemy installation done ${COLOR_OFF}"
        elif [ "$choice" == "Flask-WTF" ]; then
            pip install flask-wtf
            echo -e "${GREEN} Flask-WTF installation done ${COLOR_OFF}"
        elif [ "$choice" == "Flask-Login" ]; then
            pip install flask-login
            echo -e "${GREEN} Flask-Login installation done ${COLOR_OFF}"
        elif [ "$choice" == "Flask-Bootstrap" ]; then
            pip install bootstrap-flask
            echo -e "${GREEN} Flask-Bootstrap installation done ${COLOR_OFF}"
        elif [ "$choice" == "Python YAML" ]; then
            pip install pyyaml
            echo -e "${GREEN} Python YAML installation done ${COLOR_OFF}"
        fi
    done
    echo -e "${GREEN} Installation complete ${COLOR_OFF}"
else
    echo -e " ${RED} User selected Cancel. ${COLOR_OFF}"
fi