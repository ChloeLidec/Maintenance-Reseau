#!/bin/bash

# Reset
COLOR_OFF='\033[0m'       # Text Reset

# Regular Colors
RED='\033[0;31m'          # Red
GREEN='\033[0;32m'        # Green
YELLOW='\033[0;33m'       # Yellow
BLUE='\033[0;34m'         # Blue

CHOIX=$(whiptail --title "Git" --menu \
"Choose what you want to do" 25 80 8 \
"Commit modified files from actual directory" "" \
"Push" "" \
"Pull" "" \
"Status" "" \
"Create a branch" "" \
"Merge" "" \
"Stash" "" \
"Tag" "" 3>&1 1>&2 2>&3)

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
    fi
else
    echo "${RED} You chose Cancel. ${COLOR_OFF}"
fi