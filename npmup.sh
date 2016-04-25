#!/bin/bash
#: Title: npmupdate
#: Date: 25/04/2016
#: Author: Avraam Mavridis avr.mav@gmail.com
#: Version: 0.1.0
#: Description : sends a pull request with updated depedencies

brew install md5sha1sum

tput setab 3; tput setaf 4;
echo " UPDATE DEPEDENCIES "
tput sgr0

md5=`md5sum package.json | awk '{ print $1 }'`
echo $md5

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
      npm i ${deps[$dep]##*/} --save
    fi
  done
}

updateDepedencies prod
updateDepedencies dev

md5=`md5sum package.json | awk '{ print $1 }'`
echo $md5
