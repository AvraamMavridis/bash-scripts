#!/bin/bash
#: Title: npminit
#: Date: 23/04/2016
#: Author: Avraam Mavridis avr.mav@gmail.com
#: Version: 0.1.0
#: Description : git reset current branch, pull, and npm install

REPO_URL=$(git config --get remote.origin.url)
CURRENT_BRANCH=$(git rev-parse --abbrev-ref HEAD)

# Checks it this is a git repo
if [[ ! -n $REPO_URL ]]
then
  echo "GIT REMOTE URL DIDN'T FOUND. IS THIS A GIT REPO?"
  exit 1
fi

reset=$(git reset --hard origin/$CURRENT_BRANCH)
echo RESET : $reset
pull=$(git pull)
echo PULL : $pull
install=$(npm i)
echo NPM : $install
