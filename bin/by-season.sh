#!/bin/bash
echo "Enter the season you wish to download (ex: 01, 02, etc..)."
read season

echo "You have chosen season $season. Press enter to continue."
read enter

EPISODE_LISTS="../episodes.list.d/season$season.list"
DWNDIR="../download"

mkdir $DWNDIR

find $EPISODE_LISTS -type f | while read -r EPLIST
do
	wget -c --directory-prefix=$DWNDIR --input-file=$EPLIST
done
