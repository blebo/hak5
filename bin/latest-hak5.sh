#!/bin/bash
# hak5 weekly

dldir="/storage/video/podcasts/Hak5/S16"
sdir="/storage/video/podcasts/Hak5"

wget -q -O $sdir/weeklyfeed "http://revision3.com/hak5/feed/MP4-hd30?subshow=false"
filename=`cat $sdir/weeklyfeed | grep "mp4" | egrep -v '<guid|<atom|<itunes' | sed 's/^.*url="//' | sed 's/".*$//' | uniq | head -n1`
wget -q -P $dldir -c $filename

if [ -f $sdir/weeklyfeed ]; then
  rm $sdir/weeklyfeed
fi
