#!/bin/bash

# Reset
COLOR_OFF='\033[0m'       # Text Reset

# Regular Colors
RED='\033[0;31m'          # Red
GREEN='\033[0;32m'        # Green
YELLOW='\033[0;33m'       # Yellow
BLUE='\033[0;34m'         # Blue

echo -e "${BLUE} Welcome to the git menu ${COLOR_OFF}"
echo -e "${YELLOW} You can choose which action you want to perform. While you haven't selected cancel or quit, the menu will keep showing for you to do stuff ${COLOR_OFF}"

fini="no"
while [ "$fini" == "no" ];
do
    CHOIX=$(whiptail --title "Git" --menu \
    "Choose what you want to do" 25 80 8 \
    "Commit modified files from actual directory" "" \
    "Config" "" \
    "Push" "" \
    "Pull" "" \
    "Status" "" \
    "Create a branch" "" \
    "Merge" "" \
    "Stash" "" \
    "Tag" "" \
    "Quit" "" 3>&1 1>&2 2>&3)

    exitstatus=$?
    if [ $exitstatus = 0 ]; then
        if [ "$CHOIX" == "Commit modified files from actual directory" ]; then
            git add .
            echo -e " ${BLUE} Enter a commit message ${COLOR_OFF}"
            read MESSAGE
            git commit -m "$MESSAGE"
            echo -e " ${BLUE} Commit done ${COLOR_OFF}"
        elif [ "$CHOIX" == "Push" ]; then
            echo -e " ${BLUE} Choose where to push ${COLOR_OFF}"
            git branch
            read BRANCHPUSH
            git push origin $BRANCHPUSH
        elif [ "$CHOIX" == "Pull" ]; then
            echo -e " ${BLUE} Choose the source ${COLOR_OFF}"
            git branch
            read BRANCHEPULL
            git pull origin $BRANCHEPULL
        elif [ "$CHOIX" == "Status" ]; then
            git status
        elif [ "$CHOIX" == "Create a branch" ]; then
            echo -e " ${BLUE} Enter branch's name ${COLOR_OFF}"
            read BRANCHECREA
            git switch -c $BRANCHECREA
            echo -e " ${BLUE} You are now on branch $BRANCHECREA ${COLOR_OFF}"
        elif [ "$CHOIX" == "Merge" ]; then
            echo -e " ${BLUE} Choose source branch ${COLOR_OFF}"
            git BRANCHSOURCE
            read BRANCHESOURCE
            echo -e " ${BLUE} Chooose destination branch ${COLOR_OFF}"
            git branch
            read BRANCHDEST
            git merge $BRANCHSOURCE $BRANCHDEST
            echo -e " ${BLUE} Merge done ${COLOR_OFF}"
        elif [ "$CHOIX" == "Stash" ]; then
            git stash
            echo -e " ${BLUE} Stash done ${COLOR_OFF}"
        elif [ "$CHOIX" == "Tag" ]; then
            echo -e " ${BLUE} Enter tag's name ${COLOR_OFF}"
            read TAG
            git tag $TAG
            echo -e " ${BLUE} Tag done ${COLOR_OFF}"
        elif [ "$CHOIX" == "Config" ]; then
            echo -e " ${BLUE} Enter your name ${COLOR_OFF}"
            read NAME
            git config --global user.name "$NAME"
            echo -e " ${BLUE} Enter your email ${COLOR_OFF}"
            read EMAIL
            git config --global user.email "$EMAIL"
            echo -e " ${BLUE} Config done ${COLOR_OFF}"
        elif [ "$CHOIX" == "Quit" ]; then
            fini="yes"
        fi
    else
        echo -e "${RED} You chose Cancel. ${COLOR_OFF}"
        fini="yes"
    fi
done
