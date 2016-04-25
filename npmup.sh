#!/bin/bash
#: Title: npmupdate
#: Date: 25/04/2016
#: Author: Avraam Mavridis avr.mav@gmail.com
#: Version: 0.1.0
#: Description : Update depedencies to its latest version and create a branch with
# updated package.json from which you can create a pull request to master
# requires npm version >= 3.8.7

REPO_URL=$(git config --get remote.origin.url)

git checkout master
git pull
brew install md5sha1sum

tput setab 3; tput setaf 4;
echo " UPDATE DEPEDENCIES "
tput sgr0

# Hash of the package.json
oldMD5=`md5sum package.json | awk '{ print $1 }'`

function updateDepedencies {
  depedencies=$(npm list -parseable -depth 0 -$1)
  deps=($depedencies)

  for dep in ${!deps[@]}
  do
    if [ ! $dep -eq 0 ]
    then
      tput setab 4; tput setaf 3;
      echo ${deps[$dep]##*/}
      tput sgr0
      npm update ${deps[$dep]##*/} --$2
    fi
  done
}

# Update depedencies and save the changes to package.json
updateDepedencies prod --save
# Update devDepedencies and save the changes to package.json
updateDepedencies dev --save-dev

# Hash of the package.json with the changes
newMD5=`md5sum package.json | awk '{ print $1 }'`

if [ "$oldMD5" != "$newMD5" ]
then
    git add package.json
    git commit -m "Update depedencies"
    git checkout -b $newMD5
    git push origin $newMD5:$newMD5
fi
