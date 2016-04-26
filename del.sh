#!/bin/sh
# Move files to Trash instead of deleting them

TRASH="$HOME/.Trash/";

if [ -e "$TRASH$1" ] ; then
	TS=`date`;
	mv $1 "$TRASH/$1 $TS";	
else	
	mv $1 $TRASH;
fi
