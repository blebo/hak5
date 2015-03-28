#!/bin/bash

EPISODE_LISTS="../episodes.list.d"
DWNDIR="../download"

mkdir $DWNDIR

find $EPISODE_LISTS -type f | while read -r EPLIST
do
  wget -c --no-check-certificate --directory-prefix=$DWNDIR --input-file=$EPLIST
done
