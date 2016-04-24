#!/bin/bash
#: Title: npmdep
#: Date: 24/04/2016
#: Author: Avraam Mavridis avr.mav@gmail.com
#: Version: 0.1.0
#: Description : list npm depedencies

tput setab 4;
tput setaf 3;

echo "DEV DEPEDENCIES";
tput sgr0;
npm ll --only development --depth 0;

tput setab 4
tput setaf 3

echo "PRODUCTION DEPEDENCIES";
tput sgr0;
npm ll --only production --depth 0;
