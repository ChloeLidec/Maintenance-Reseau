#!/bin/bash

# Reset
COLOR_OFF='\033[0m'       # Text Reset

# Regular Colors
RED='\033[0;31m'          # Red
GREEN='\033[0;32m'        # Green
YELLOW='\033[0;33m'       # Yellow
BLUE='\033[0;34m'         # Blue

CHOIX=$(whiptail --title "MariaDB" --menu "Choose what you want to do" 25 80 8 \
"Install MariaDB" "" \
"Configure MariaDB" "" \
"Create a database" "" \
"Show databases" "" \
"Create user and grant privileges" "" \
"Create a table" "" \
"Show tables" "" 3>&1 1>&2 2>&3)

exitstatus=$?
if [ $exitstatus = 0 ]; then
    if [ "$CHOIX" = "Install MariaDB" ]; then
        sudo apt install -y mariadb-server
        echo -e "{GREEN} MariaDB installation done {COLOR_OFF}"
    elif [ "$CHOIX" = "Configure MariaDB" ]; then
        sudo mysql_secure_installation < .mariadb.txt
        echo -e "{GREEN} MariaDB configuration done {COLOR_OFF}"
    elif [ "$CHOIX" = "Create a database" ]; then
        echo -e "{BLUE} What do you want to name your database? {COLOR_OFF}"
        read DATABASE_NAME
        echo "CREATE DATABASE $DATABASE_NAME;" | sudo mysql
        REP=$(whiptail --title "MariaDB" --yesno "Do you want to grant privileges to a user?" 8 78)
        if [ $REP = 0 ]; then
            echo "SELECT User FROM mysql.user;" | sudo mysql
            echo -e "{BLUE} Choose a user to grant privileges to {COLOR_OFF}"
            read USER_NAME
            echo "GRANT ALL PRIVILEGES ON $DATABASE_NAME.* TO '$USER_NAME'@'localhost' WITH GRANT OPTION;" | sudo mysql
            echo "FLUSH PRIVILEGES;" | sudo mysql
        fi
        echo -e "{GREEN} Your database has been created! {COLOR_OFF}"
    elif [ "$CHOIX" = "Create user and grant privileges" ]; then
        echo -e "{BLUE} What do you want to name your user? {COLOR_OFF}"
        read USER_NAME
        echo -e "{BLUE} What do you want to name your password? {COLOR_OFF}"
        read USER_PASSWORD
        echo "CREATE USER '$USER_NAME'@'localhost' IDENTIFIED BY '$USER_PASSWORD';" | sudo mysql
        echo "GRANT ALL PRIVILEGES ON *.* TO '$USER_NAME'@'localhost' WITH GRANT OPTION;" | sudo mysql
        echo "FLUSH PRIVILEGES;" | sudo mysql
        echo -e "{GREEN} Your user has been created! {COLOR_OFF}"
    elif [ "$CHOIX" = "Show databases" ]; then
        echo "SHOW DATABASES;" | sudo mysql
    elif [ "$CHOIX" = "Create a table" ]; then
        echo "SHOW DATABASES;" | sudo mysql
        echo -e "{BLUE} Choose a database to create a table in {COLOR_OFF}"
        read DATABASE_NAME
        echo "USE $DATABASE_NAME;" | sudo mysql
        echo "SHOW TABLES;" | sudo mysql
        echo -e "{BLUE} What do you want to name your table? {COLOR_OFF}"
        read TABLE_NAME
        echo -e "{BLUE} How many columns do you want to create? {COLOR_OFF}"
        read COLUMN_NUMBER
        echo "CREATE TABLE $TABLE_NAME (" | sudo mysql
        for ((i=1; i<=$COLUMN_NUMBER; i++))
        do
            echo -e "{BLUE} What do you want to name your column? {COLOR_OFF}"
            read COLUMN_NAME
            echo -e "{BLUE} What type of data do you want to store in this column?(Please mind how you write it) {COLOR_OFF}"
            echo -e "{YELLOW} Examples: VARCHAR(255),INT,DATE,TEXT {COLOR_OFF}"
            read COLUMN_TYPE
            echo "$COLUMN_NAME $COLUMN_TYPE," | sudo mysql
        done
        echo ");" | sudo mysql
        echo -e "{GREEN} Your table has been created! {COLOR_OFF}"
    elif [ "$CHOIX" = "Show tables" ]; then
        echo "SHOW DATABASES;" | sudo mysql
        echo -e "{BLUE} Choose a database to show tables in {COLOR_OFF}"
        read DATABASE_NAME
        echo "USE $DATABASE_NAME;" | sudo mysql
        echo "SHOW TABLES;" | sudo mysql
    fi
else
    echo "You chose Cancel."
fi
