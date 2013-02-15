#!/bin/bash
# hak5 weekly
dldir="/storage/video/podcasts/Hak5/S12"
sdir="/storage/video/podcasts/Hak5"
wget -O $sdir/weeklyfeed "http://revision3.com/hak5/feed/MP4-hd30?subshow=false"
filename=`cat $sdir/weeklyfeed | grep "mp4" | egrep -v '<guid|<atom|<itunes' | sed 's/^.*url="//' | sed 's/".*$//' | uniq | head -n1`
wget -P $dldir -c $filename
rm $sdir/weeklyfeed
