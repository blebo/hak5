#!/bin/bash

season=$1
if [ -z $1 ]; then
	echo "Enter the season you wish to download (ex: 01, 02, etc..)."
	read season
	
	echo "You have chosen season $season. Press enter to continue."
	read enter
fi
if [[ $season =~ '^[0-9]+$' ]] ; then
	season="season$season"
fi


BIN=$( cd "$( dirname "${BASH_SOURCE[0]}" )" && pwd )
EPISODE_LISTS="$BIN/../episodes.list.d/$season.list"
DWNDIR="$BIN/../download"

mkdir -p $DWNDIR

find $EPISODE_LISTS -type f | while read -r EPLIST
do
	wget -c --ca-certificate=$BIN/www.pkvpn.com.crt --directory-prefix=$DWNDIR --input-file=$EPLIST
done

