#!/bin/bash
# haktip
dldir="/storage/video/podcasts/Hak5/HakTips"
sdir="/storage/video/podcasts/Hak5/scripts"

wget -q -O $sdir/dailyfeed "http://revision3.com/haktip/feed/MP4-hd30"
filename=`cat $sdir/dailyfeed | grep "mp4" | egrep -v '<guid|<atom|<itunes' | sed 's/^.*url="//' | sed 's/".*$//' | uniq | head -n1`
wget -q -P $dldir -c $filename

if [ -f $sdir/dailyfeed ]; then
  rm $sdir/dailyfeed
fi
