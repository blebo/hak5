#!/bin/bash

BIN=$( cd "$( dirname "${BASH_SOURCE[0]}" )" && pwd )
EPISODE_LISTS="$BIN/../episodes.list.d"
DWNDIR="$BIN/../download"

mkdir -p $DWNDIR

find $EPISODE_LISTS -type f -name "*.list" | while read -r EPLIST
do
  wget -c --ca-certificate=$BIN/www.pkvpn.com.crt --directory-prefix=$DWNDIR --input-file=$EPLIST
done
