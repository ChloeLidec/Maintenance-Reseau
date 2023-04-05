#!/bin/bash
chmod u+x code.sh java.sh python.sh electron.sh flask.sh git.sh mariadb.sh

# Reset
COLOR_OFF='\033[0m'       # Text Reset

# Regular Colors
RED='\033[0;31m'          # Red
GREEN='\033[0;32m'        # Green
YELLOW='\033[0;33m'       # Yellow
BLUE='\033[0;34m'         # Blue

echo -e "${BLUE} Welcome to the general menu ${COLOR_OFF}"
echo -e "${YELLOW} You can choose which subprogram you want to use. While you haven't selected cancel or quit, the menu will keep showing for you to do stuff ${COLOR_OFF}"

CHOIX=""
exitstatus=0
while [ "$CHOIX" != "Quitter" ] && [ $exitstatus = 0 ];
do
    CHOIX=$(whiptail --title "General menu" --menu \
    "Choose what subprogram you want to use" 25 80 8 \
    "Code extensions" "" \
    "Java" "" \
    "Python" "" \
    "Electron" "" \
    "Flask" "" \
    "Git" "" \
    "MariaDB" "" \
    "Quit" 3>&1 1>&2 2>&3)
    exitstatus=$?
    if [ $exitstatus = 0 ]; then
        if [ "$CHOIX" == "Code extensions" ]; then
            ./code.sh
        elif [ "$CHOIX" == "Java" ]; then
            ./java.sh
        elif [ "$CHOIX" == "Python" ]; then
            ./python.sh
        elif [ "$CHOIX" == "Electron" ]; then
            ./electron.sh
        elif [ "$CHOIX" == "Flask" ]; then
            ./flask.sh
        elif [ "$CHOIX" == "Git" ]; then
            ./git.sh
        elif [ "$CHOIX" == "MariaDB" ]; then
            ./mariadb.sh
        fi
    else
        echo -e " ${RED} User selected Cancel. ${COLOR_OFF}"
    fi
    fi
done
