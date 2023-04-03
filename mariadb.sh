#!/bin/bash

# Reset
COLOR_OFF='\033[0m'       # Text Reset

# Regular Colors
RED='\033[0;31m'          # Red
GREEN='\033[0;32m'        # Green
YELLOW='\033[0;33m'       # Yellow
BLUE='\033[0;34m'         # Blue

CHOIX = $(whiptail --title "MariaDB" --menu "Choose what you want to do" 25 80 8 \
"Install MariaDB" "" \
"Uninstall MariaDB" "" \
"Create a database" "" \
"Show databases" "" \
"Create a table" "" \
"Show tables" "" 3>&1 1>&2 2>&3)


sudo apt install mariadb-server
sudo mysql_secure_installation

